import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/Feed/Domain/clubfeed_db.dart';


final ClubFeedDBProvider = Provider<ClubFeedDB>((ref) {
  return ClubFeedDB(ref);
});