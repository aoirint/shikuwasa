import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

part 'directshow_device_list.freezed.dart';
part 'directshow_device_list.g.dart';

final logger = Logger('directshow_device_list');

const ffmpegExecutable = 'ffmpeg';

@freezed
class DirectshowDevice with _$DirectshowDevice {
  const factory DirectshowDevice({
    required String deviceType,
    required String deviceName,
    required String deviceAlternativeName,
  }) = _DirectshowDevice;

  factory DirectshowDevice.fromJson(Map<String, Object?> json) =>
      _$DirectshowDeviceFromJson(json);
}

class DirectshowRecordingSession {
  final String recordingId;
  final int processId;
  final String outputFilePath;
  final List<String> logList;
  final Isolate isolate;
  final ReceivePort childToParentReceivePort;
  final Stream<dynamic> childToParentReceivePortBroadcastStream;
  final SendPort parentToChildSendPort;

  const DirectshowRecordingSession({
    required this.recordingId,
    required this.processId,
    required this.outputFilePath,
    required this.logList,
    required this.isolate,
    required this.childToParentReceivePort,
    required this.childToParentReceivePortBroadcastStream,
    required this.parentToChildSendPort,
  });
}

class DirectshowRecordingIpcMessageParentToChildSendPort {
  final SendPort parentToChildSendPort;

  const DirectshowRecordingIpcMessageParentToChildSendPort({
    required this.parentToChildSendPort,
  });
}

class DirectshowRecordingIpcMessageStarted {
  final int processId;

  const DirectshowRecordingIpcMessageStarted({
    required this.processId,
  });
}

class DirectshowRecordingIpcMessageStop {}

class DirectshowRecordingIpcMessageFinalized {}

class DirectshowRecordingIpcMessageLog {
  final String text;

  const DirectshowRecordingIpcMessageLog({
    required this.text,
  });
}

class DirectshowRecordingIpcMessageProcessLog {
  final String text;

  const DirectshowRecordingIpcMessageProcessLog({
    required this.text,
  });
}

class DirectshowRecordingArgs {
  final SendPort childToParentSendPort;
  final String deviceAlternativeName;
  final String outputFilePath;

  const DirectshowRecordingArgs({
    required this.childToParentSendPort,
    required this.deviceAlternativeName,
    required this.outputFilePath,
  });
}

void _entryPointRecording(DirectshowRecordingArgs arguments) async {
  final childToParentSendPort = arguments.childToParentSendPort;
  final deviceAlternativeName = arguments.deviceAlternativeName;
  final outputFilePath = arguments.outputFilePath;

  final parentToChildReceivePort = ReceivePort();
  final parentToChildSendPort = parentToChildReceivePort.sendPort;

  childToParentSendPort.send(DirectshowRecordingIpcMessageParentToChildSendPort(
      parentToChildSendPort: parentToChildSendPort));

  final stopMessageCompleter = Completer();

  final process = await Process.start(
    ffmpegExecutable,
    [
      '-hide_banner',
      '-loglevel',
      '+repeat',
      '-y',
      '-f',
      'dshow',
      '-i',
      'audio=$deviceAlternativeName',
      outputFilePath,
    ],
    environment: {
      'AV_LOG_FORCE_NOCOLOR': '1',
    },
  );
  childToParentSendPort
      .send(DirectshowRecordingIpcMessageLog(text: 'PID ${process.pid}'));

  process.stderr
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((lineText) {
    childToParentSendPort
        .send(DirectshowRecordingIpcMessageProcessLog(text: lineText));
  });

  parentToChildReceivePort.listen((message) async {
    if (message is DirectshowRecordingIpcMessageStop) {
      childToParentSendPort.send(const DirectshowRecordingIpcMessageLog(
          text: 'stop message received'));
      stopMessageCompleter.complete();
    }
  });

  childToParentSendPort
      .send(const DirectshowRecordingIpcMessageLog(text: 'started'));
  childToParentSendPort
      .send(DirectshowRecordingIpcMessageStarted(processId: process.pid));

  await stopMessageCompleter.future;
  process.kill();
  final exitCode = await process.exitCode;

  parentToChildReceivePort.close();

  childToParentSendPort
      .send(DirectshowRecordingIpcMessageLog(text: 'Exit code $exitCode'));

  childToParentSendPort
      .send(const DirectshowRecordingIpcMessageLog(text: 'finalized'));
  childToParentSendPort.send(DirectshowRecordingIpcMessageFinalized());
}

abstract class DirectshowRepository {
  Future<List<DirectshowDevice>> getDeviceList();

  /// returns 'Recording Id'.
  Future<String> startRecording({
    required String deviceAlternativeName,
    required String outputFilePath,
  });

  /// [recordingId] is the return value of [startRecording].
  Future<void> stopRecording({
    required String recordingId,
  });
}

class DirectshowRepositoryImpl extends DirectshowRepository {
  var recordingSessionList = <DirectshowRecordingSession>[];

  @override
  Future<List<DirectshowDevice>> getDeviceList() async {
    const lineSplitter = LineSplitter();

    const arguments = [
      '-hide_banner',
      '-list_devices',
      'true',
      '-f',
      'dshow',
      '-i',
      'dummy',
    ];
    final result = await Process.run(
      ffmpegExecutable,
      arguments,
      environment: {
        'AV_LOG_FORCE_NOCOLOR': '1',
      },
      stderrEncoding: Encoding.getByName('utf-8'),
    );
    final stderrText = result.stderr;
    if (stderrText is! String) {
      throw Exception('Unexpected stderr type (${stderrText.runtimeType})');
    }

    final stderrLines = lineSplitter.convert(stderrText);
    final deviceLineRegex = RegExp(r'^\[dshow\ @\ .+\]\ \"(.+)\"\ \((.+)\)$');
    final alternativeNameLineRegex =
        RegExp(r'^\[dshow\ @\ .+\]\ \ \ Alternative\ name\ \"(.+)\"$');

    final deviceList = <DirectshowDevice>[];

    var lineIndex = 0;
    while (lineIndex < stderrLines.length) {
      final deviceLineMatch =
          deviceLineRegex.firstMatch(stderrLines[lineIndex]);
      lineIndex += 1;
      if (deviceLineMatch == null) {
        logger.info('no device line: ${stderrLines[lineIndex - 1]}');
        continue;
      }

      final alternativeNameLineMatch =
          alternativeNameLineRegex.firstMatch(stderrLines[lineIndex]);
      lineIndex += 1;
      if (alternativeNameLineMatch == null) {
        logger.info('no alternative name line: ${stderrLines[lineIndex - 1]}');
        continue;
      }

      final deviceName = deviceLineMatch.group(1)!;
      final deviceType = deviceLineMatch.group(2)!;
      final deviceAlternativeName = alternativeNameLineMatch.group(1)!;

      deviceList.add(
        DirectshowDevice(
          deviceType: deviceType,
          deviceName: deviceName,
          deviceAlternativeName: deviceAlternativeName,
        ),
      );
    }

    return deviceList;
  }

  @override
  Future<String> startRecording({
    required String deviceAlternativeName,
    required String outputFilePath,
  }) async {
    final deviceList = await getDeviceList();
    final device = deviceList.firstWhereOrNull(
      (device) => device.deviceAlternativeName == deviceAlternativeName,
    );
    if (device == null) {
      throw Exception(
          'No device found (deviceAlternativeName: $deviceAlternativeName)');
    }

    final recordingId = const Uuid().v4();

    final childToParentReceivePort = ReceivePort();
    final childToParentSendPort = childToParentReceivePort.sendPort;

    final parentToChildSendPortMessageCompleter =
        Completer<DirectshowRecordingIpcMessageParentToChildSendPort>();
    final startedMessageCompleter =
        Completer<DirectshowRecordingIpcMessageStarted>();

    final childToParentReceivePortBroadcastStream =
        childToParentReceivePort.asBroadcastStream();

    final childToParentSubscription =
        childToParentReceivePortBroadcastStream.listen((message) {
      if (message is DirectshowRecordingIpcMessageParentToChildSendPort) {
        parentToChildSendPortMessageCompleter.complete(message);
      }
      if (message is DirectshowRecordingIpcMessageStarted) {
        startedMessageCompleter.complete(message);
      }
    });

    final logList = <String>[];

    childToParentReceivePortBroadcastStream.listen((message) {
      if (message is DirectshowRecordingIpcMessageLog) {
        logger.info(message.text);
      }
      if (message is DirectshowRecordingIpcMessageProcessLog) {
        logger.info(message.text);
        logList.add(message.text);
      }
    });

    final isolate = await Isolate.spawn(
      _entryPointRecording,
      DirectshowRecordingArgs(
        childToParentSendPort: childToParentSendPort,
        deviceAlternativeName: deviceAlternativeName,
        outputFilePath: outputFilePath,
      ),
    );

    final parentToChildSendPortMessage =
        await parentToChildSendPortMessageCompleter.future;
    final startedMessage = await startedMessageCompleter.future;
    await childToParentSubscription
        .cancel(); // unsubscribe after childSendPort received

    recordingSessionList.add(
      DirectshowRecordingSession(
        recordingId: recordingId,
        processId: startedMessage.processId,
        outputFilePath: outputFilePath,
        logList: logList,
        isolate: isolate,
        childToParentReceivePort: childToParentReceivePort,
        childToParentReceivePortBroadcastStream:
            childToParentReceivePortBroadcastStream,
        parentToChildSendPort:
            parentToChildSendPortMessage.parentToChildSendPort,
      ),
    );

    return recordingId;
  }

  @override
  Future<void> stopRecording({
    required String recordingId,
  }) async {
    final recordingSession = recordingSessionList.firstWhereOrNull(
        (recordingSession) => recordingSession.recordingId == recordingId);
    if (recordingSession == null) {
      throw Exception('No recording session found (recordingId: $recordingId)');
    }

    final finalizedMessageCompleter =
        Completer<DirectshowRecordingIpcMessageFinalized>();

    final childToParentReceivePortBroadcastStream =
        recordingSession.childToParentReceivePortBroadcastStream;
    final childToParentSubscription =
        childToParentReceivePortBroadcastStream.listen((message) {
      if (message is DirectshowRecordingIpcMessageFinalized) {
        finalizedMessageCompleter.complete(message);
      }
    });

    recordingSession.parentToChildSendPort
        .send(DirectshowRecordingIpcMessageStop());

    await finalizedMessageCompleter.future;
    await childToParentSubscription.cancel();

    recordingSession.childToParentReceivePort.close();
    recordingSession.isolate.kill();
  }
}
