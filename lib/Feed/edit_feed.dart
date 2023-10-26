import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/data_model/coursefeed_db.dart';
import '../data_model/user_db.dart';
class EditFeedPage extends ConsumerWidget {
  final String? feedId;

  EditFeedPage({this.feedId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _courseNameController = TextEditingController();
    final _postController = TextEditingController();
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state?? '';
    final feed = ref.watch(CourseFeedDBProvider).feeds.firstWhere(
            (element) => element.feed_id == feedId,
        orElse: () => CourseFeedData(
            feed_id: '', course_name: '', post: '', student_id: ''));

    _courseNameController.text = feed.course_name;
    _postController.text = feed.post;

    return Scaffold(
      appBar: AppBar(
        title: Text(feedId == null ? 'Add Post' : 'Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _courseNameController,
              decoration: InputDecoration(labelText: 'Course Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _postController,
              decoration: InputDecoration(labelText: 'Post Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final courseDB = ref.read(CourseFeedDBProvider);
                if (feedId == null) {
                  // Add new post
                  courseDB.addCourseFeed(
                    feed_id: 'feed-${(courseDB.feeds.length + 1).toString().padLeft(2, '0')}',
                    course_name: _courseNameController.text,
                    post: _postController.text,
                    student_id: currentUserID, // This should be the logged-in user's ID
                  );
                } else {
                  // Update existing post
                  courseDB.updateCourseFeed(
                    feed_id: feedId!,
                    course_name: _courseNameController.text,
                    post: _postController.text,
                    student_id: currentUserID, // This should be the logged-in user's ID
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text(feedId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
