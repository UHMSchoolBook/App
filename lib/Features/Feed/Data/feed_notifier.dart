import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/Feed/Domain/coursefeed_db.dart';
final CourseFeedDBProvider = Provider<CourseFeedDB>((ref) {
  return CourseFeedDB(ref);
});