// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'courses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClassData _$ClassDataFromJson(Map<String, dynamic> json) {
  return _ClassData.fromJson(json);
}

/// @nodoc
mixin _$ClassData {
  String get class_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get student_ids => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get instructor => throw _privateConstructorUsedError;
  String get schedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassDataCopyWith<ClassData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassDataCopyWith<$Res> {
  factory $ClassDataCopyWith(ClassData value, $Res Function(ClassData) then) =
      _$ClassDataCopyWithImpl<$Res, ClassData>;
  @useResult
  $Res call(
      {String class_id,
      String name,
      List<String> student_ids,
      String description,
      String instructor,
      String schedule});
}

/// @nodoc
class _$ClassDataCopyWithImpl<$Res, $Val extends ClassData>
    implements $ClassDataCopyWith<$Res> {
  _$ClassDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? class_id = null,
    Object? name = null,
    Object? student_ids = null,
    Object? description = null,
    Object? instructor = null,
    Object? schedule = null,
  }) {
    return _then(_value.copyWith(
      class_id: null == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      student_ids: null == student_ids
          ? _value.student_ids
          : student_ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      instructor: null == instructor
          ? _value.instructor
          : instructor // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClassDataImplCopyWith<$Res>
    implements $ClassDataCopyWith<$Res> {
  factory _$$ClassDataImplCopyWith(
          _$ClassDataImpl value, $Res Function(_$ClassDataImpl) then) =
      __$$ClassDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String class_id,
      String name,
      List<String> student_ids,
      String description,
      String instructor,
      String schedule});
}

/// @nodoc
class __$$ClassDataImplCopyWithImpl<$Res>
    extends _$ClassDataCopyWithImpl<$Res, _$ClassDataImpl>
    implements _$$ClassDataImplCopyWith<$Res> {
  __$$ClassDataImplCopyWithImpl(
      _$ClassDataImpl _value, $Res Function(_$ClassDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? class_id = null,
    Object? name = null,
    Object? student_ids = null,
    Object? description = null,
    Object? instructor = null,
    Object? schedule = null,
  }) {
    return _then(_$ClassDataImpl(
      class_id: null == class_id
          ? _value.class_id
          : class_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      student_ids: null == student_ids
          ? _value._student_ids
          : student_ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      instructor: null == instructor
          ? _value.instructor
          : instructor // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassDataImpl implements _ClassData {
  const _$ClassDataImpl(
      {required this.class_id,
      required this.name,
      required final List<String> student_ids,
      required this.description,
      required this.instructor,
      required this.schedule})
      : _student_ids = student_ids;

  factory _$ClassDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassDataImplFromJson(json);

  @override
  final String class_id;
  @override
  final String name;
  final List<String> _student_ids;
  @override
  List<String> get student_ids {
    if (_student_ids is EqualUnmodifiableListView) return _student_ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_student_ids);
  }

  @override
  final String description;
  @override
  final String instructor;
  @override
  final String schedule;

  @override
  String toString() {
    return 'ClassData(class_id: $class_id, name: $name, student_ids: $student_ids, description: $description, instructor: $instructor, schedule: $schedule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassDataImpl &&
            (identical(other.class_id, class_id) ||
                other.class_id == class_id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._student_ids, _student_ids) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.instructor, instructor) ||
                other.instructor == instructor) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      class_id,
      name,
      const DeepCollectionEquality().hash(_student_ids),
      description,
      instructor,
      schedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassDataImplCopyWith<_$ClassDataImpl> get copyWith =>
      __$$ClassDataImplCopyWithImpl<_$ClassDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassDataImplToJson(
      this,
    );
  }
}

abstract class _ClassData implements ClassData {
  const factory _ClassData(
      {required final String class_id,
      required final String name,
      required final List<String> student_ids,
      required final String description,
      required final String instructor,
      required final String schedule}) = _$ClassDataImpl;

  factory _ClassData.fromJson(Map<String, dynamic> json) =
      _$ClassDataImpl.fromJson;

  @override
  String get class_id;
  @override
  String get name;
  @override
  List<String> get student_ids;
  @override
  String get description;
  @override
  String get instructor;
  @override
  String get schedule;
  @override
  @JsonKey(ignore: true)
  _$$ClassDataImplCopyWith<_$ClassDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
