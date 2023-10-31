import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
class CourseFeedData {
  CourseFeedData(
      {required this.feed_id,
        required this.course_name,
        required this.post,
        required this.student_id,});

  String feed_id;
  String course_name;
  String post;
  String student_id;
}

class CourseFeedDB {
  CourseFeedDB(this.ref);
  final ProviderRef<CourseFeedDB> ref;
  final List<CourseFeedData> _feeds = [
    CourseFeedData(
        feed_id: 'feed-001',
        course_name: 'Introduction to Programming',
        post: 'Today the Class was Great!',
        student_id: 'user-001'),
    CourseFeedData(
        feed_id: 'feed-002',
        course_name: 'Software engineering',
        post: 'We are learning flutter now!',
        student_id: 'user-002'),
    CourseFeedData(
        feed_id: 'feed-003',
        course_name: 'Mobile Application Development',
        post: 'Reminder: Due date of assignment is on wednesday',
        student_id: 'user-003'),
  ];
  List<CourseFeedData> get feeds => _feeds;
  void addCourseFeed({
    required String feed_id,
    required String course_name,
    required String post,
    required String student_id,}) {
    String id = 'feed-${(_feeds.length + 1).toString().padLeft(2, '0')}';
    CourseFeedData data = CourseFeedData(
      feed_id: id,
      course_name: course_name,
      post: post,
      student_id: student_id,);
    _feeds.add(data);
  }


void updateCourseFeed({
  required String feed_id,
  required String course_name,
  required String post,
  required String student_id,}) {
  String id = 'feed-${(_feeds.length + 1).toString().padLeft(2, '0')}';
  _feeds.removeWhere((CourseFeedData) => CourseFeedData.feed_id == feed_id);
  CourseFeedData data = CourseFeedData(
    feed_id: id,
    course_name: course_name,
    post: post,
    student_id: student_id,);
  _feeds.add(data);
}
}



final CourseFeedDBProvider = Provider<CourseFeedDB>((ref) {
  return CourseFeedDB(ref);
});