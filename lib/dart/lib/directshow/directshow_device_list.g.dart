// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directshow_device_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DirectshowDevice _$$_DirectshowDeviceFromJson(Map<String, dynamic> json) =>
    _$_DirectshowDevice(
      deviceType: json['deviceType'] as String,
      deviceName: json['deviceName'] as String,
      deviceAlternativeName: json['deviceAlternativeName'] as String,
    );

Map<String, dynamic> _$$_DirectshowDeviceToJson(_$_DirectshowDevice instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'deviceName': instance.deviceName,
      'deviceAlternativeName': instance.deviceAlternativeName,
    };

_$_DirectshowRecordingIpcMessageProcessProgress
    _$$_DirectshowRecordingIpcMessageProcessProgressFromJson(
            Map<String, dynamic> json) =>
        _$_DirectshowRecordingIpcMessageProcessProgress(
          bitrate: json['bitrate'] as String,
          totalSize: json['totalSize'] as int,
          outTimeUs: json['outTimeUs'] as int,
          speed: json['speed'] as String,
          progress: json['progress'] as String,
        );

Map<String, dynamic> _$$_DirectshowRecordingIpcMessageProcessProgressToJson(
        _$_DirectshowRecordingIpcMessageProcessProgress instance) =>
    <String, dynamic>{
      'bitrate': instance.bitrate,
      'totalSize': instance.totalSize,
      'outTimeUs': instance.outTimeUs,
      'speed': instance.speed,
      'progress': instance.progress,
    };

_$_DirectshowRecordingProgress _$$_DirectshowRecordingProgressFromJson(
        Map<String, dynamic> json) =>
    _$_DirectshowRecordingProgress(
      recordingId: json['recordingId'] as String,
      bitrate: json['bitrate'] as String?,
      totalSize: json['totalSize'] as int?,
      outTimeUs: json['outTimeUs'] as int?,
      speed: json['speed'] as String?,
      progress: json['progress'] as String?,
    );

Map<String, dynamic> _$$_DirectshowRecordingProgressToJson(
        _$_DirectshowRecordingProgress instance) =>
    <String, dynamic>{
      'recordingId': instance.recordingId,
      'bitrate': instance.bitrate,
      'totalSize': instance.totalSize,
      'outTimeUs': instance.outTimeUs,
      'speed': instance.speed,
      'progress': instance.progress,
    };
