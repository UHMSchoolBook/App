// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      imagePath: json['imagePath'] as String,
      bio: json['bio'] as String,
      isOnline: json['isOnline'] as bool,
      lastActive: DateTime.parse(json['lastActive'] as String),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'imagePath': instance.imagePath,
      'bio': instance.bio,
      'isOnline': instance.isOnline,
      'lastActive': instance.lastActive.toIso8601String(),
    };
