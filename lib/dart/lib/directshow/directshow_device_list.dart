import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

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

abstract class DirectshowRepository {
  Future<List<DirectshowDevice>> getDirectshowDeviceList();
}

class DirectshowRepositoryImpl extends DirectshowRepository {
  @override
  Future<List<DirectshowDevice>> getDirectshowDeviceList() async {
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
}
