
class ClubFeedData {
  ClubFeedData(
      {required this.feed_id,
        required this.club_name,
        required this.post,
        required this.student_id,});

  String feed_id;
  String club_name;
  String post;
  String student_id;
}

class ClubFeedDB {
  final List<ClubFeedData> _cfeeds = [
    ClubFeedData(
        feed_id: 'feed-001',
        club_name: 'Reading Group',
        post: 'We will read Mark Twain this week on Thursday!',
        student_id: 'user-001'),
    ClubFeedData(
        feed_id: 'feed-002',
        club_name: 'Programming Club',
        post: 'We are learning flutter now! and It is Cool!',
        student_id: 'user-002'),
    ClubFeedData(
        feed_id: 'feed-003',
        club_name: 'Machine Learning Club',
        post: 'No club activities for next week. Have Fun!',
        student_id: 'user-003'),
  ];
  List<ClubFeedData> get cfeeds => _cfeeds;
}
/// The singleton instance providing access to all user data for clients.
ClubFeedDB clubfeedDB = ClubFeedDB();