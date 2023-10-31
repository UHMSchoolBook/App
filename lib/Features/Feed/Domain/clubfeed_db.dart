import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
  ClubFeedDB(this.ref);
  final ProviderRef<ClubFeedDB> ref;
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

  void addClubFeed({
    required String feed_id,
    required String club_name,
    required String post,
    required String student_id,}) {
    String id = 'feed-${(_cfeeds.length + 1).toString().padLeft(2, '0')}';
    ClubFeedData data = ClubFeedData(
      feed_id: id,
      club_name: club_name,
      post: post,
      student_id: student_id,);
    _cfeeds.add(data);
  }


  void updateClubFeed({
    required String feed_id,
    required String club_name,
    required String post,
    required String student_id,}) {
    String id = 'feed-${(_cfeeds.length + 1).toString().padLeft(2, '0')}';
    _cfeeds.removeWhere((ClubFeedData) => ClubFeedData.feed_id == feed_id);
    ClubFeedData data = ClubFeedData(
      feed_id: id,
      club_name: club_name,
      post: post,
      student_id: student_id,);
    _cfeeds.add(data);
  }
}
final ClubFeedDBProvider = Provider<ClubFeedDB>((ref) {
  return ClubFeedDB(ref);
});
