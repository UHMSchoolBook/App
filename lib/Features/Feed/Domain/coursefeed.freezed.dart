// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coursefeed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseFeedData _$CourseFeedDataFromJson(Map<String, dynamic> json) {
  return _CourseFeedData.fromJson(json);
}

/// @nodoc
mixin _$CourseFeedData {
  String get feed_id => throw _privateConstructorUsedError;
  String get course_name => throw _privateConstructorUsedError;
  String get post => throw _privateConstructorUsedError;
  String get student_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseFeedDataCopyWith<CourseFeedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseFeedDataCopyWith<$Res> {
  factory $CourseFeedDataCopyWith(
          CourseFeedData value, $Res Function(CourseFeedData) then) =
      _$CourseFeedDataCopyWithImpl<$Res, CourseFeedData>;
  @useResult
  $Res call(
      {String feed_id, String course_name, String post, String student_id});
}

/// @nodoc
class _$CourseFeedDataCopyWithImpl<$Res, $Val extends CourseFeedData>
    implements $CourseFeedDataCopyWith<$Res> {
  _$CourseFeedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feed_id = null,
    Object? course_name = null,
    Object? post = null,
    Object? student_id = null,
  }) {
    return _then(_value.copyWith(
      feed_id: null == feed_id
          ? _value.feed_id
          : feed_id // ignore: cast_nullable_to_non_nullable
              as String,
      course_name: null == course_name
          ? _value.course_name
          : course_name // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String,
      student_id: null == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseFeedDataImplCopyWith<$Res>
    implements $CourseFeedDataCopyWith<$Res> {
  factory _$$CourseFeedDataImplCopyWith(_$CourseFeedDataImpl value,
          $Res Function(_$CourseFeedDataImpl) then) =
      __$$CourseFeedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String feed_id, String course_name, String post, String student_id});
}

/// @nodoc
class __$$CourseFeedDataImplCopyWithImpl<$Res>
    extends _$CourseFeedDataCopyWithImpl<$Res, _$CourseFeedDataImpl>
    implements _$$CourseFeedDataImplCopyWith<$Res> {
  __$$CourseFeedDataImplCopyWithImpl(
      _$CourseFeedDataImpl _value, $Res Function(_$CourseFeedDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feed_id = null,
    Object? course_name = null,
    Object? post = null,
    Object? student_id = null,
  }) {
    return _then(_$CourseFeedDataImpl(
      feed_id: null == feed_id
          ? _value.feed_id
          : feed_id // ignore: cast_nullable_to_non_nullable
              as String,
      course_name: null == course_name
          ? _value.course_name
          : course_name // ignore: cast_nullable_to_non_nullable
              as String,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String,
      student_id: null == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseFeedDataImpl implements _CourseFeedData {
  const _$CourseFeedDataImpl(
      {required this.feed_id,
      required this.course_name,
      required this.post,
      required this.student_id});

  factory _$CourseFeedDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseFeedDataImplFromJson(json);

  @override
  final String feed_id;
  @override
  final String course_name;
  @override
  final String post;
  @override
  final String student_id;

  @override
  String toString() {
    return 'CourseFeedData(feed_id: $feed_id, course_name: $course_name, post: $post, student_id: $student_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseFeedDataImpl &&
            (identical(other.feed_id, feed_id) || other.feed_id == feed_id) &&
            (identical(other.course_name, course_name) ||
                other.course_name == course_name) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.student_id, student_id) ||
                other.student_id == student_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, feed_id, course_name, post, student_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseFeedDataImplCopyWith<_$CourseFeedDataImpl> get copyWith =>
      __$$CourseFeedDataImplCopyWithImpl<_$CourseFeedDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseFeedDataImplToJson(
      this,
    );
  }
}

abstract class _CourseFeedData implements CourseFeedData {
  const factory _CourseFeedData(
      {required final String feed_id,
      required final String course_name,
      required final String post,
      required final String student_id}) = _$CourseFeedDataImpl;

  factory _CourseFeedData.fromJson(Map<String, dynamic> json) =
      _$CourseFeedDataImpl.fromJson;

  @override
  String get feed_id;
  @override
  String get course_name;
  @override
  String get post;
  @override
  String get student_id;
  @override
  @JsonKey(ignore: true)
  _$$CourseFeedDataImplCopyWith<_$CourseFeedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
