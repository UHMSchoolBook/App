import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace.freezed.dart';
part 'marketplace.g.dart';

/// Garden Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class MarketPlaceData with _$MarketPlaceData {
  const factory MarketPlaceData(
      {required String item_id,
        required String name,
        required String price,
        required String imagePath,
        required String student_id,}) = _MarketPlaceData;

  factory MarketPlaceData.fromJson(Map<String, dynamic> json) => _$MarketPlaceDataFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<MarketPlaceData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/MarketPlace.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => MarketPlaceData.fromJson(jsonData)).toList();
  }
}