// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      sentTime: DateTime.parse(json['sentTime'] as String),
      content: json['content'] as String,
      messageType: MessageType.fromJson(json['messageType'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'sentTime': instance.sentTime.toIso8601String(),
      'content': instance.content,
      'messageType': instance.messageType,
    };
