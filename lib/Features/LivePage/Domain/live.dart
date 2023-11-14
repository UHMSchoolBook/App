import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../Data/livedb.dart';

part 'live.freezed.dart';
part 'live.g.dart'; // Generated file for JSON serialization

@freezed
class Live with _$Live {
  const factory Live({
    required String name,
    required String songImageUrl,
    required String major,
    required String gender,
    required String distance,
    required String imageUrl,
  }) = _Live;

  factory Live.fromJson(Map<String, dynamic> json) => _$LiveFromJson(json);
}

LiveDB liveDB = LiveDB();
