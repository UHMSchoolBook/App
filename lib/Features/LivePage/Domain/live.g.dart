// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveImpl _$$LiveImplFromJson(Map<String, dynamic> json) => _$LiveImpl(
      name: json['name'] as String,
      songImageUrl: json['songImageUrl'] as String,
      major: json['major'] as String,
      gender: json['gender'] as String,
      distance: json['distance'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$LiveImplToJson(_$LiveImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'songImageUrl': instance.songImageUrl,
      'major': instance.major,
      'gender': instance.gender,
      'distance': instance.distance,
      'imageUrl': instance.imageUrl,
    };
