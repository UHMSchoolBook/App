// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'housesharing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HouseSharingData _$HouseSharingDataFromJson(Map<String, dynamic> json) {
  return _HouseSharingData.fromJson(json);
}

/// @nodoc
mixin _$HouseSharingData {
  String get item_id => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get rent => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get student_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseSharingDataCopyWith<HouseSharingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseSharingDataCopyWith<$Res> {
  factory $HouseSharingDataCopyWith(
          HouseSharingData value, $Res Function(HouseSharingData) then) =
      _$HouseSharingDataCopyWithImpl<$Res, HouseSharingData>;
  @useResult
  $Res call(
      {String item_id,
      String location,
      String rent,
      String imagePath,
      String student_id});
}

/// @nodoc
class _$HouseSharingDataCopyWithImpl<$Res, $Val extends HouseSharingData>
    implements $HouseSharingDataCopyWith<$Res> {
  _$HouseSharingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? location = null,
    Object? rent = null,
    Object? imagePath = null,
    Object? student_id = null,
  }) {
    return _then(_value.copyWith(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rent: null == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      student_id: null == student_id
          ? _value.student_id
          : student_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseSharingDataImplCopyWith<$Res>
    implements $HouseSharingDataCopyWith<$Res> {
  factory _$$HouseSharingDataImplCopyWith(_$HouseSharingDataImpl value,
          $Res Function(_$HouseSharingDataImpl) then) =
      __$$HouseSharingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String item_id,
      String location,
      String rent,
      String imagePath,
      String student_id});
}

/// @nodoc
class __$$HouseSharingDataImplCopyWithImpl<$Res>
    extends _$HouseSharingDataCopyWithImpl<$Res, _$HouseSharingDataImpl>
    implements _$$HouseSharingDataImplCopyWith<$Res> {
  __$$HouseSharingDataImplCopyWithImpl(_$HouseSharingDataImpl _value,
      $Res Function(_$HouseSharingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? location = null,
    Object? rent = null,
    Object? imagePath = null,
    Object? student_id = null,
  }) {
    return _then(_$HouseSharingDataImpl(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      rent: null == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
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
class _$HouseSharingDataImpl implements _HouseSharingData {
  const _$HouseSharingDataImpl(
      {required this.item_id,
      required this.location,
      required this.rent,
      required this.imagePath,
      required this.student_id});

  factory _$HouseSharingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseSharingDataImplFromJson(json);

  @override
  final String item_id;
  @override
  final String location;
  @override
  final String rent;
  @override
  final String imagePath;
  @override
  final String student_id;

  @override
  String toString() {
    return 'HouseSharingData(item_id: $item_id, location: $location, rent: $rent, imagePath: $imagePath, student_id: $student_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseSharingDataImpl &&
            (identical(other.item_id, item_id) || other.item_id == item_id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rent, rent) || other.rent == rent) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.student_id, student_id) ||
                other.student_id == student_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, item_id, location, rent, imagePath, student_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseSharingDataImplCopyWith<_$HouseSharingDataImpl> get copyWith =>
      __$$HouseSharingDataImplCopyWithImpl<_$HouseSharingDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseSharingDataImplToJson(
      this,
    );
  }
}

abstract class _HouseSharingData implements HouseSharingData {
  const factory _HouseSharingData(
      {required final String item_id,
      required final String location,
      required final String rent,
      required final String imagePath,
      required final String student_id}) = _$HouseSharingDataImpl;

  factory _HouseSharingData.fromJson(Map<String, dynamic> json) =
      _$HouseSharingDataImpl.fromJson;

  @override
  String get item_id;
  @override
  String get location;
  @override
  String get rent;
  @override
  String get imagePath;
  @override
  String get student_id;
  @override
  @JsonKey(ignore: true)
  _$$HouseSharingDataImplCopyWith<_$HouseSharingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
