// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarketPlaceData _$MarketPlaceDataFromJson(Map<String, dynamic> json) {
  return _MarketPlaceData.fromJson(json);
}

/// @nodoc
mixin _$MarketPlaceData {
  String get item_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get student_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketPlaceDataCopyWith<MarketPlaceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketPlaceDataCopyWith<$Res> {
  factory $MarketPlaceDataCopyWith(
          MarketPlaceData value, $Res Function(MarketPlaceData) then) =
      _$MarketPlaceDataCopyWithImpl<$Res, MarketPlaceData>;
  @useResult
  $Res call(
      {String item_id,
      String name,
      String price,
      String imagePath,
      String student_id});
}

/// @nodoc
class _$MarketPlaceDataCopyWithImpl<$Res, $Val extends MarketPlaceData>
    implements $MarketPlaceDataCopyWith<$Res> {
  _$MarketPlaceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? name = null,
    Object? price = null,
    Object? imagePath = null,
    Object? student_id = null,
  }) {
    return _then(_value.copyWith(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MarketPlaceDataImplCopyWith<$Res>
    implements $MarketPlaceDataCopyWith<$Res> {
  factory _$$MarketPlaceDataImplCopyWith(_$MarketPlaceDataImpl value,
          $Res Function(_$MarketPlaceDataImpl) then) =
      __$$MarketPlaceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String item_id,
      String name,
      String price,
      String imagePath,
      String student_id});
}

/// @nodoc
class __$$MarketPlaceDataImplCopyWithImpl<$Res>
    extends _$MarketPlaceDataCopyWithImpl<$Res, _$MarketPlaceDataImpl>
    implements _$$MarketPlaceDataImplCopyWith<$Res> {
  __$$MarketPlaceDataImplCopyWithImpl(
      _$MarketPlaceDataImpl _value, $Res Function(_$MarketPlaceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item_id = null,
    Object? name = null,
    Object? price = null,
    Object? imagePath = null,
    Object? student_id = null,
  }) {
    return _then(_$MarketPlaceDataImpl(
      item_id: null == item_id
          ? _value.item_id
          : item_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
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
class _$MarketPlaceDataImpl implements _MarketPlaceData {
  const _$MarketPlaceDataImpl(
      {required this.item_id,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.student_id});

  factory _$MarketPlaceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketPlaceDataImplFromJson(json);

  @override
  final String item_id;
  @override
  final String name;
  @override
  final String price;
  @override
  final String imagePath;
  @override
  final String student_id;

  @override
  String toString() {
    return 'MarketPlaceData(item_id: $item_id, name: $name, price: $price, imagePath: $imagePath, student_id: $student_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketPlaceDataImpl &&
            (identical(other.item_id, item_id) || other.item_id == item_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.student_id, student_id) ||
                other.student_id == student_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, item_id, name, price, imagePath, student_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketPlaceDataImplCopyWith<_$MarketPlaceDataImpl> get copyWith =>
      __$$MarketPlaceDataImplCopyWithImpl<_$MarketPlaceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketPlaceDataImplToJson(
      this,
    );
  }
}

abstract class _MarketPlaceData implements MarketPlaceData {
  const factory _MarketPlaceData(
      {required final String item_id,
      required final String name,
      required final String price,
      required final String imagePath,
      required final String student_id}) = _$MarketPlaceDataImpl;

  factory _MarketPlaceData.fromJson(Map<String, dynamic> json) =
      _$MarketPlaceDataImpl.fromJson;

  @override
  String get item_id;
  @override
  String get name;
  @override
  String get price;
  @override
  String get imagePath;
  @override
  String get student_id;
  @override
  @JsonKey(ignore: true)
  _$$MarketPlaceDataImplCopyWith<_$MarketPlaceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
