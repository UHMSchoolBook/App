import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups.freezed.dart';
part 'groups.g.dart';

@freezed
class GroupData with _$GroupData {
  const factory GroupData({
    required String group_id,
    required String name,
    required List<String> student_ids,
    required String description,
  }) = _GroupData;

  factory GroupData.fromJson(Map<String, dynamic> json) => _$GroupDataFromJson(json);
  static Future<List<GroupData>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/groups.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => GroupData.fromJson(jsonData)).toList();
  }

}