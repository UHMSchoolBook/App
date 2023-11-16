// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'housesharing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseSharingDataImpl _$$HouseSharingDataImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseSharingDataImpl(
      item_id: json['item_id'] as String,
      location: json['location'] as String,
      rent: json['rent'] as String,
      imagePath: json['imagePath'] as String,
      student_id: json['student_id'] as String,
    );

Map<String, dynamic> _$$HouseSharingDataImplToJson(
        _$HouseSharingDataImpl instance) =>
    <String, dynamic>{
      'item_id': instance.item_id,
      'location': instance.location,
      'rent': instance.rent,
      'imagePath': instance.imagePath,
      'student_id': instance.student_id,
    };
