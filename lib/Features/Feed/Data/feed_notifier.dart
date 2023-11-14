import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Domain/coursefeed.dart';
import '../Domain/coursefeed_collection.dart';

// Provider for CourseFeedDB
final courseFeedDBProvider = Provider((ref) => CourseFeedDB());

// StreamProvider for Course Feeds
final courseFeedsStreamProvider = StreamProvider.autoDispose<List<CourseFeedData>>((ref) {
  final courseFeedDB = ref.watch(courseFeedDBProvider);
  return courseFeedDB.getCourseFeeds();
});

final courseFeedByIdProvider = FutureProvider.family<CourseFeedData?, String>((ref, feedId) {
  return ref.read(courseFeedDBProvider).getCourseFeedById(feedId);
});

