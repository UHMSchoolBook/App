// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      id: json['id'] as String,
      student_id: json['student_id'] as String,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': const TimestampConverter().toJson(instance.date),
      'id': instance.id,
      'student_id': instance.student_id,
    };
