import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses.freezed.dart';
part 'courses.g.dart';

@freezed
class ClassData with _$ClassData {
  const factory ClassData({
    required String class_id,
    required String name,
    required List<String> student_ids,
    required String description,
    required String instructor,
    required String schedule,
  }) = _ClassData;

  factory ClassData.fromJson(Map<String, dynamic> json) => _$ClassDataFromJson(json);

  static Future<List<ClassData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/courses.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => ClassData.fromJson(jsonData)).toList();
  }

}
