
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
}
/// The singleton instance providing access to all user data for clients.
CourseFeedDB coursefeedDB = CourseFeedDB();