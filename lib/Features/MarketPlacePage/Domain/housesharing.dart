import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'housesharing.freezed.dart';
part 'housesharing.g.dart';

/// Garden Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class HouseSharingData with _$HouseSharingData {
  const factory HouseSharingData(
      {required String item_id,
        required String location,
        required String rent,
        required String imagePath,
        required String student_id,}) = _HouseSharingData;

  factory HouseSharingData.fromJson(Map<String, dynamic> json) => _$HouseSharingDataFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<HouseSharingData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/HouseSharing.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => HouseSharingData.fromJson(jsonData)).toList();
  }
}
