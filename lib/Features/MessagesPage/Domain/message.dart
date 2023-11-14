import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart'; // For JSON serialization

@freezed
class MessageData with _$MessageData {
  const factory MessageData({
    required String username,
    required String text,
    required String avatarUrl,
  }) = _MessageData;

  factory MessageData.fromJson(Map<String, dynamic> json) => _$MessageDataFromJson(json);
}
