import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coursefeed.freezed.dart';
part 'coursefeed.g.dart';

/// Garden Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class CourseFeedData with _$CourseFeedData {
  const factory CourseFeedData(
      {required String feed_id,
        required String course_name,
        required String post,
        required String student_id,}) = _CourseFeedData;

  factory CourseFeedData.fromJson(Map<String, dynamic> json) => _$CourseFeedDataFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<CourseFeedData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/ClubFeed.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => CourseFeedData.fromJson(jsonData)).toList();
  }
}
