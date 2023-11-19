// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketPlaceDataImpl _$$MarketPlaceDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MarketPlaceDataImpl(
      item_id: json['item_id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      imagePath: json['imagePath'] as String,
      student_id: json['student_id'] as String,
    );

Map<String, dynamic> _$$MarketPlaceDataImplToJson(
        _$MarketPlaceDataImpl instance) =>
    <String, dynamic>{
      'item_id': instance.item_id,
      'name': instance.name,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'student_id': instance.student_id,
    };
