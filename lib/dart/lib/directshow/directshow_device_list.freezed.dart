// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directshow_device_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DirectshowDevice _$DirectshowDeviceFromJson(Map<String, dynamic> json) {
  return _DirectshowDevice.fromJson(json);
}

/// @nodoc
mixin _$DirectshowDevice {
  String get deviceType => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get deviceAlternativeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectshowDeviceCopyWith<DirectshowDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectshowDeviceCopyWith<$Res> {
  factory $DirectshowDeviceCopyWith(
          DirectshowDevice value, $Res Function(DirectshowDevice) then) =
      _$DirectshowDeviceCopyWithImpl<$Res, DirectshowDevice>;
  @useResult
  $Res call(
      {String deviceType, String deviceName, String deviceAlternativeName});
}

/// @nodoc
class _$DirectshowDeviceCopyWithImpl<$Res, $Val extends DirectshowDevice>
    implements $DirectshowDeviceCopyWith<$Res> {
  _$DirectshowDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceType = null,
    Object? deviceName = null,
    Object? deviceAlternativeName = null,
  }) {
    return _then(_value.copyWith(
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceAlternativeName: null == deviceAlternativeName
          ? _value.deviceAlternativeName
          : deviceAlternativeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DirectshowDeviceCopyWith<$Res>
    implements $DirectshowDeviceCopyWith<$Res> {
  factory _$$_DirectshowDeviceCopyWith(
          _$_DirectshowDevice value, $Res Function(_$_DirectshowDevice) then) =
      __$$_DirectshowDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceType, String deviceName, String deviceAlternativeName});
}

/// @nodoc
class __$$_DirectshowDeviceCopyWithImpl<$Res>
    extends _$DirectshowDeviceCopyWithImpl<$Res, _$_DirectshowDevice>
    implements _$$_DirectshowDeviceCopyWith<$Res> {
  __$$_DirectshowDeviceCopyWithImpl(
      _$_DirectshowDevice _value, $Res Function(_$_DirectshowDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceType = null,
    Object? deviceName = null,
    Object? deviceAlternativeName = null,
  }) {
    return _then(_$_DirectshowDevice(
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceAlternativeName: null == deviceAlternativeName
          ? _value.deviceAlternativeName
          : deviceAlternativeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectshowDevice implements _DirectshowDevice {
  const _$_DirectshowDevice(
      {required this.deviceType,
      required this.deviceName,
      required this.deviceAlternativeName});

  factory _$_DirectshowDevice.fromJson(Map<String, dynamic> json) =>
      _$$_DirectshowDeviceFromJson(json);

  @override
  final String deviceType;
  @override
  final String deviceName;
  @override
  final String deviceAlternativeName;

  @override
  String toString() {
    return 'DirectshowDevice(deviceType: $deviceType, deviceName: $deviceName, deviceAlternativeName: $deviceAlternativeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectshowDevice &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceAlternativeName, deviceAlternativeName) ||
                other.deviceAlternativeName == deviceAlternativeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceType, deviceName, deviceAlternativeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DirectshowDeviceCopyWith<_$_DirectshowDevice> get copyWith =>
      __$$_DirectshowDeviceCopyWithImpl<_$_DirectshowDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectshowDeviceToJson(
      this,
    );
  }
}

abstract class _DirectshowDevice implements DirectshowDevice {
  const factory _DirectshowDevice(
      {required final String deviceType,
      required final String deviceName,
      required final String deviceAlternativeName}) = _$_DirectshowDevice;

  factory _DirectshowDevice.fromJson(Map<String, dynamic> json) =
      _$_DirectshowDevice.fromJson;

  @override
  String get deviceType;
  @override
  String get deviceName;
  @override
  String get deviceAlternativeName;
  @override
  @JsonKey(ignore: true)
  _$$_DirectshowDeviceCopyWith<_$_DirectshowDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

DirectshowRecordingIpcMessageProcessProgress
    _$DirectshowRecordingIpcMessageProcessProgressFromJson(
        Map<String, dynamic> json) {
  return _DirectshowRecordingIpcMessageProcessProgress.fromJson(json);
}

/// @nodoc
mixin _$DirectshowRecordingIpcMessageProcessProgress {
  String get bitrate => throw _privateConstructorUsedError;
  int get totalSize => throw _privateConstructorUsedError;
  int get outTimeUs => throw _privateConstructorUsedError;
  String get speed => throw _privateConstructorUsedError;
  String get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectshowRecordingIpcMessageProcessProgressCopyWith<
          DirectshowRecordingIpcMessageProcessProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectshowRecordingIpcMessageProcessProgressCopyWith<$Res> {
  factory $DirectshowRecordingIpcMessageProcessProgressCopyWith(
          DirectshowRecordingIpcMessageProcessProgress value,
          $Res Function(DirectshowRecordingIpcMessageProcessProgress) then) =
      _$DirectshowRecordingIpcMessageProcessProgressCopyWithImpl<$Res,
          DirectshowRecordingIpcMessageProcessProgress>;
  @useResult
  $Res call(
      {String bitrate,
      int totalSize,
      int outTimeUs,
      String speed,
      String progress});
}

/// @nodoc
class _$DirectshowRecordingIpcMessageProcessProgressCopyWithImpl<$Res,
        $Val extends DirectshowRecordingIpcMessageProcessProgress>
    implements $DirectshowRecordingIpcMessageProcessProgressCopyWith<$Res> {
  _$DirectshowRecordingIpcMessageProcessProgressCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
    Object? totalSize = null,
    Object? outTimeUs = null,
    Object? speed = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as String,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      outTimeUs: null == outTimeUs
          ? _value.outTimeUs
          : outTimeUs // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DirectshowRecordingIpcMessageProcessProgressCopyWith<$Res>
    implements $DirectshowRecordingIpcMessageProcessProgressCopyWith<$Res> {
  factory _$$_DirectshowRecordingIpcMessageProcessProgressCopyWith(
          _$_DirectshowRecordingIpcMessageProcessProgress value,
          $Res Function(_$_DirectshowRecordingIpcMessageProcessProgress) then) =
      __$$_DirectshowRecordingIpcMessageProcessProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bitrate,
      int totalSize,
      int outTimeUs,
      String speed,
      String progress});
}

/// @nodoc
class __$$_DirectshowRecordingIpcMessageProcessProgressCopyWithImpl<$Res>
    extends _$DirectshowRecordingIpcMessageProcessProgressCopyWithImpl<$Res,
        _$_DirectshowRecordingIpcMessageProcessProgress>
    implements _$$_DirectshowRecordingIpcMessageProcessProgressCopyWith<$Res> {
  __$$_DirectshowRecordingIpcMessageProcessProgressCopyWithImpl(
      _$_DirectshowRecordingIpcMessageProcessProgress _value,
      $Res Function(_$_DirectshowRecordingIpcMessageProcessProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
    Object? totalSize = null,
    Object? outTimeUs = null,
    Object? speed = null,
    Object? progress = null,
  }) {
    return _then(_$_DirectshowRecordingIpcMessageProcessProgress(
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as String,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      outTimeUs: null == outTimeUs
          ? _value.outTimeUs
          : outTimeUs // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectshowRecordingIpcMessageProcessProgress
    implements _DirectshowRecordingIpcMessageProcessProgress {
  const _$_DirectshowRecordingIpcMessageProcessProgress(
      {required this.bitrate,
      required this.totalSize,
      required this.outTimeUs,
      required this.speed,
      required this.progress});

  factory _$_DirectshowRecordingIpcMessageProcessProgress.fromJson(
          Map<String, dynamic> json) =>
      _$$_DirectshowRecordingIpcMessageProcessProgressFromJson(json);

  @override
  final String bitrate;
  @override
  final int totalSize;
  @override
  final int outTimeUs;
  @override
  final String speed;
  @override
  final String progress;

  @override
  String toString() {
    return 'DirectshowRecordingIpcMessageProcessProgress(bitrate: $bitrate, totalSize: $totalSize, outTimeUs: $outTimeUs, speed: $speed, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectshowRecordingIpcMessageProcessProgress &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.outTimeUs, outTimeUs) ||
                other.outTimeUs == outTimeUs) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bitrate, totalSize, outTimeUs, speed, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DirectshowRecordingIpcMessageProcessProgressCopyWith<
          _$_DirectshowRecordingIpcMessageProcessProgress>
      get copyWith =>
          __$$_DirectshowRecordingIpcMessageProcessProgressCopyWithImpl<
                  _$_DirectshowRecordingIpcMessageProcessProgress>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectshowRecordingIpcMessageProcessProgressToJson(
      this,
    );
  }
}

abstract class _DirectshowRecordingIpcMessageProcessProgress
    implements DirectshowRecordingIpcMessageProcessProgress {
  const factory _DirectshowRecordingIpcMessageProcessProgress(
          {required final String bitrate,
          required final int totalSize,
          required final int outTimeUs,
          required final String speed,
          required final String progress}) =
      _$_DirectshowRecordingIpcMessageProcessProgress;

  factory _DirectshowRecordingIpcMessageProcessProgress.fromJson(
          Map<String, dynamic> json) =
      _$_DirectshowRecordingIpcMessageProcessProgress.fromJson;

  @override
  String get bitrate;
  @override
  int get totalSize;
  @override
  int get outTimeUs;
  @override
  String get speed;
  @override
  String get progress;
  @override
  @JsonKey(ignore: true)
  _$$_DirectshowRecordingIpcMessageProcessProgressCopyWith<
          _$_DirectshowRecordingIpcMessageProcessProgress>
      get copyWith => throw _privateConstructorUsedError;
}

DirectshowRecordingProgress _$DirectshowRecordingProgressFromJson(
    Map<String, dynamic> json) {
  return _DirectshowRecordingProgress.fromJson(json);
}

/// @nodoc
mixin _$DirectshowRecordingProgress {
  String get recordingId => throw _privateConstructorUsedError;
  String? get bitrate => throw _privateConstructorUsedError;
  int? get totalSize => throw _privateConstructorUsedError;
  int? get outTimeUs => throw _privateConstructorUsedError;
  String? get speed => throw _privateConstructorUsedError;
  String? get progress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectshowRecordingProgressCopyWith<DirectshowRecordingProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectshowRecordingProgressCopyWith<$Res> {
  factory $DirectshowRecordingProgressCopyWith(
          DirectshowRecordingProgress value,
          $Res Function(DirectshowRecordingProgress) then) =
      _$DirectshowRecordingProgressCopyWithImpl<$Res,
          DirectshowRecordingProgress>;
  @useResult
  $Res call(
      {String recordingId,
      String? bitrate,
      int? totalSize,
      int? outTimeUs,
      String? speed,
      String? progress});
}

/// @nodoc
class _$DirectshowRecordingProgressCopyWithImpl<$Res,
        $Val extends DirectshowRecordingProgress>
    implements $DirectshowRecordingProgressCopyWith<$Res> {
  _$DirectshowRecordingProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordingId = null,
    Object? bitrate = freezed,
    Object? totalSize = freezed,
    Object? outTimeUs = freezed,
    Object? speed = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      recordingId: null == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as String,
      bitrate: freezed == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSize: freezed == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int?,
      outTimeUs: freezed == outTimeUs
          ? _value.outTimeUs
          : outTimeUs // ignore: cast_nullable_to_non_nullable
              as int?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DirectshowRecordingProgressCopyWith<$Res>
    implements $DirectshowRecordingProgressCopyWith<$Res> {
  factory _$$_DirectshowRecordingProgressCopyWith(
          _$_DirectshowRecordingProgress value,
          $Res Function(_$_DirectshowRecordingProgress) then) =
      __$$_DirectshowRecordingProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recordingId,
      String? bitrate,
      int? totalSize,
      int? outTimeUs,
      String? speed,
      String? progress});
}

/// @nodoc
class __$$_DirectshowRecordingProgressCopyWithImpl<$Res>
    extends _$DirectshowRecordingProgressCopyWithImpl<$Res,
        _$_DirectshowRecordingProgress>
    implements _$$_DirectshowRecordingProgressCopyWith<$Res> {
  __$$_DirectshowRecordingProgressCopyWithImpl(
      _$_DirectshowRecordingProgress _value,
      $Res Function(_$_DirectshowRecordingProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordingId = null,
    Object? bitrate = freezed,
    Object? totalSize = freezed,
    Object? outTimeUs = freezed,
    Object? speed = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$_DirectshowRecordingProgress(
      recordingId: null == recordingId
          ? _value.recordingId
          : recordingId // ignore: cast_nullable_to_non_nullable
              as String,
      bitrate: freezed == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSize: freezed == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int?,
      outTimeUs: freezed == outTimeUs
          ? _value.outTimeUs
          : outTimeUs // ignore: cast_nullable_to_non_nullable
              as int?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectshowRecordingProgress implements _DirectshowRecordingProgress {
  const _$_DirectshowRecordingProgress(
      {required this.recordingId,
      required this.bitrate,
      required this.totalSize,
      required this.outTimeUs,
      required this.speed,
      required this.progress});

  factory _$_DirectshowRecordingProgress.fromJson(Map<String, dynamic> json) =>
      _$$_DirectshowRecordingProgressFromJson(json);

  @override
  final String recordingId;
  @override
  final String? bitrate;
  @override
  final int? totalSize;
  @override
  final int? outTimeUs;
  @override
  final String? speed;
  @override
  final String? progress;

  @override
  String toString() {
    return 'DirectshowRecordingProgress(recordingId: $recordingId, bitrate: $bitrate, totalSize: $totalSize, outTimeUs: $outTimeUs, speed: $speed, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectshowRecordingProgress &&
            (identical(other.recordingId, recordingId) ||
                other.recordingId == recordingId) &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.outTimeUs, outTimeUs) ||
                other.outTimeUs == outTimeUs) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, recordingId, bitrate, totalSize, outTimeUs, speed, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DirectshowRecordingProgressCopyWith<_$_DirectshowRecordingProgress>
      get copyWith => __$$_DirectshowRecordingProgressCopyWithImpl<
          _$_DirectshowRecordingProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectshowRecordingProgressToJson(
      this,
    );
  }
}

abstract class _DirectshowRecordingProgress
    implements DirectshowRecordingProgress {
  const factory _DirectshowRecordingProgress(
      {required final String recordingId,
      required final String? bitrate,
      required final int? totalSize,
      required final int? outTimeUs,
      required final String? speed,
      required final String? progress}) = _$_DirectshowRecordingProgress;

  factory _DirectshowRecordingProgress.fromJson(Map<String, dynamic> json) =
      _$_DirectshowRecordingProgress.fromJson;

  @override
  String get recordingId;
  @override
  String? get bitrate;
  @override
  int? get totalSize;
  @override
  int? get outTimeUs;
  @override
  String? get speed;
  @override
  String? get progress;
  @override
  @JsonKey(ignore: true)
  _$$_DirectshowRecordingProgressCopyWith<_$_DirectshowRecordingProgress>
      get copyWith => throw _privateConstructorUsedError;
}
