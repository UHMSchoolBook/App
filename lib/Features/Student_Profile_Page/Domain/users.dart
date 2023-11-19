import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String name,
    required String email,
    required String imagePath,
    required String bio,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  static Future<List<UserData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/Users.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => UserData.fromJson(jsonData)).toList();
  }
}
