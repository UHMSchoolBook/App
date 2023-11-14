import 'package:cloud_firestore/cloud_firestore.dart';
import 'coursefeed.dart';

class CourseFeedDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<CourseFeedData>> getCourseFeeds() {
    return _firestore.collection('courseFeeds').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CourseFeedData.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  Future<void> addCourseFeed(CourseFeedData feed) {
    return _firestore.collection('courseFeeds').add(feed.toJson());
  }

  Future<void> updateCourseFeed(String feedId, CourseFeedData feed) {
    return _firestore.collection('courseFeeds').doc(feedId).update(feed.toJson());
  }

  Future<CourseFeedData?> getCourseFeedById(String feedId) async {
    try {
      var doc = await _firestore.collection('courseFeeds').doc(feedId).get();
      if (doc.exists) {
        return CourseFeedData.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      // Handle exceptions
      print('Error getting course feed: $e');
    }
    return null;
  }
}
