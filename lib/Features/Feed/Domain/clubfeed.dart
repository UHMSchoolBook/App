import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clubfeed.freezed.dart';
part 'clubfeed.g.dart';

/// Garden Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class ClubFeedData with _$ClubFeedData {
  const factory ClubFeedData(
      {required String feed_id,
        required String club_name,
        required String post,
        required String student_id,}) = _ClubFeedData;

  factory ClubFeedData.fromJson(Map<String, dynamic> json) => _$ClubFeedDataFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<ClubFeedData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/ClubFeed.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => ClubFeedData.fromJson(jsonData)).toList();
  }
}
