// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coursefeed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseFeedDataImpl _$$CourseFeedDataImplFromJson(Map<String, dynamic> json) =>
    _$CourseFeedDataImpl(
      feed_id: json['feed_id'] as String,
      course_name: json['course_name'] as String,
      post: json['post'] as String,
      student_id: json['student_id'] as String,
    );

Map<String, dynamic> _$$CourseFeedDataImplToJson(
        _$CourseFeedDataImpl instance) =>
    <String, dynamic>{
      'feed_id': instance.feed_id,
      'course_name': instance.course_name,
      'post': instance.post,
      'student_id': instance.student_id,
    };
