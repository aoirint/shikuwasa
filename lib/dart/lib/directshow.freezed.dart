// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directshow.dart';

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
