import 'package:cloud_firestore/cloud_firestore.dart';

import 'clubfeed.dart';

class ClubFeedDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ClubFeedData>> getFeeds() {
    return _firestore.collection('clubFeeds').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ClubFeedData.fromJson(doc.data())).toList();
    });
  }

  Future<void> addFeed(ClubFeedData feed) {
    return _firestore.collection('clubFeeds').add(feed.toJson());
  }

  Future<void> updateFeed(String feedId, ClubFeedData feed) {
    return _firestore.collection('clubFeeds').doc(feedId).update(feed.toJson());
  }
  Future<ClubFeedData?> getFeedById(String feedId) async {
    try {
      var doc = await _firestore.collection('clubFeeds').doc(feedId).get();
      if (doc.exists) {
        return ClubFeedData.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      // Handle exceptions
      print('Error getting feed: $e');
    }
    return null;
  }
}
