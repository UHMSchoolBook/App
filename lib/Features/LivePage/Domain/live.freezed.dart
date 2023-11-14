// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Live _$LiveFromJson(Map<String, dynamic> json) {
  return _Live.fromJson(json);
}

/// @nodoc
mixin _$Live {
  String get name => throw _privateConstructorUsedError;
  String get songImageUrl => throw _privateConstructorUsedError;
  String get major => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveCopyWith<Live> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveCopyWith<$Res> {
  factory $LiveCopyWith(Live value, $Res Function(Live) then) =
      _$LiveCopyWithImpl<$Res, Live>;
  @useResult
  $Res call(
      {String name,
      String songImageUrl,
      String major,
      String gender,
      String distance,
      String imageUrl});
}

/// @nodoc
class _$LiveCopyWithImpl<$Res, $Val extends Live>
    implements $LiveCopyWith<$Res> {
  _$LiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? songImageUrl = null,
    Object? major = null,
    Object? gender = null,
    Object? distance = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      songImageUrl: null == songImageUrl
          ? _value.songImageUrl
          : songImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveImplCopyWith<$Res> implements $LiveCopyWith<$Res> {
  factory _$$LiveImplCopyWith(
          _$LiveImpl value, $Res Function(_$LiveImpl) then) =
      __$$LiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String songImageUrl,
      String major,
      String gender,
      String distance,
      String imageUrl});
}

/// @nodoc
class __$$LiveImplCopyWithImpl<$Res>
    extends _$LiveCopyWithImpl<$Res, _$LiveImpl>
    implements _$$LiveImplCopyWith<$Res> {
  __$$LiveImplCopyWithImpl(_$LiveImpl _value, $Res Function(_$LiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? songImageUrl = null,
    Object? major = null,
    Object? gender = null,
    Object? distance = null,
    Object? imageUrl = null,
  }) {
    return _then(_$LiveImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      songImageUrl: null == songImageUrl
          ? _value.songImageUrl
          : songImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveImpl with DiagnosticableTreeMixin implements _Live {
  const _$LiveImpl(
      {required this.name,
      required this.songImageUrl,
      required this.major,
      required this.gender,
      required this.distance,
      required this.imageUrl});

  factory _$LiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveImplFromJson(json);

  @override
  final String name;
  @override
  final String songImageUrl;
  @override
  final String major;
  @override
  final String gender;
  @override
  final String distance;
  @override
  final String imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Live(name: $name, songImageUrl: $songImageUrl, major: $major, gender: $gender, distance: $distance, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Live'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('songImageUrl', songImageUrl))
      ..add(DiagnosticsProperty('major', major))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.songImageUrl, songImageUrl) ||
                other.songImageUrl == songImageUrl) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, songImageUrl, major, gender, distance, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveImplCopyWith<_$LiveImpl> get copyWith =>
      __$$LiveImplCopyWithImpl<_$LiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveImplToJson(
      this,
    );
  }
}

abstract class _Live implements Live {
  const factory _Live(
      {required final String name,
      required final String songImageUrl,
      required final String major,
      required final String gender,
      required final String distance,
      required final String imageUrl}) = _$LiveImpl;

  factory _Live.fromJson(Map<String, dynamic> json) = _$LiveImpl.fromJson;

  @override
  String get name;
  @override
  String get songImageUrl;
  @override
  String get major;
  @override
  String get gender;
  @override
  String get distance;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$LiveImplCopyWith<_$LiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
