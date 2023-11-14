// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDataImpl _$$MessageDataImplFromJson(Map<String, dynamic> json) =>
    _$MessageDataImpl(
      username: json['username'] as String,
      text: json['text'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );

Map<String, dynamic> _$$MessageDataImplToJson(_$MessageDataImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'text': instance.text,
      'avatarUrl': instance.avatarUrl,
    };
