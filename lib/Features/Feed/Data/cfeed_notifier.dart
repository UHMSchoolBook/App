import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/Feed/Domain/clubfeed_collection.dart';

import '../Domain/clubfeed.dart';

// Provider for ClubFeedDB
final clubFeedDBProvider = Provider((ref) => ClubFeedDB());

// StreamProvider for Club Feeds
final clubFeedsStreamProvider = StreamProvider.autoDispose<List<ClubFeedData>>((ref) {
  final clubFeedDB = ref.watch(clubFeedDBProvider);
  return clubFeedDB.getFeeds();
});

final clubFeedByIdProvider = FutureProvider.family<ClubFeedData?, String>((ref, feedId) {
  return ref.read(clubFeedDBProvider).getFeedById(feedId);
});
