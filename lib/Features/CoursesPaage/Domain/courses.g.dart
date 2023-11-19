// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassDataImpl _$$ClassDataImplFromJson(Map<String, dynamic> json) =>
    _$ClassDataImpl(
      class_id: json['class_id'] as String,
      name: json['name'] as String,
      student_ids: (json['student_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      instructor: json['instructor'] as String,
      schedule: json['schedule'] as String,
    );

Map<String, dynamic> _$$ClassDataImplToJson(_$ClassDataImpl instance) =>
    <String, dynamic>{
      'class_id': instance.class_id,
      'name': instance.name,
      'student_ids': instance.student_ids,
      'description': instance.description,
      'instructor': instance.instructor,
      'schedule': instance.schedule,
    };
