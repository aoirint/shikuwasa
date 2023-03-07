import 'dart:io';

import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:shikuwasa/dart/lib/child_process/child_process.dart';

import 'lib/directshow/directshow_device_list.dart';

final logger = Logger('main');

void main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  final directshowRepository = DirectshowRepositoryImpl();
  final deviceList = await directshowRepository.getDeviceList();
  logger.info(deviceList);

  final firstAudioDevice =
      deviceList.firstWhereOrNull((device) => device.deviceType == 'audio');
  if (firstAudioDevice == null) {
    throw Exception('No audio device found');
  }
  logger.info(firstAudioDevice.deviceAlternativeName);

  final workingDirectory = Directory.current.absolute.path;
  final outputFilePath = p.join(workingDirectory, 'a.wav');
  logger.info(workingDirectory);
  logger.info(outputFilePath);

  final recordingId = await directshowRepository.startRecording(
    deviceAlternativeName: firstAudioDevice.deviceAlternativeName,
    outputFilePath: outputFilePath,
  );

  final unsubscribeRecordingState =
      directshowRepository.listenRecordingProgress(
          recordingId: recordingId,
          listener: (recordingState) {
            logger.info('MAIN $recordingState');
          });

  logger.info('start waiting');
  await Future.delayed(const Duration(seconds: 10));
  logger.info('finished waiting');

  await directshowRepository.stopRecording(recordingId: recordingId);
  unsubscribeRecordingState.call();

  logger.info('exiting');
  await finalizeChildProcesses();
}
