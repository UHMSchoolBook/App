import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';
part 'events.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String title,
    String? description,
    required DateTime date,
    required String id,
    required String student_id,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
