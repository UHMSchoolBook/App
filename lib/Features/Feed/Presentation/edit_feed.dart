import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/Feed/Domain/coursefeed.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';

import '../Data/feed_notifier.dart';

class EditFeedPage extends ConsumerWidget {
  final String? feedId;

  EditFeedPage({this.feedId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _courseNameController = TextEditingController();
    final _postController = TextEditingController();
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    // Load existing feed data if feedId is not null
    if (feedId != null) {
      final courseFeedDataAsyncValue = ref.watch(courseFeedByIdProvider(feedId!));
      courseFeedDataAsyncValue.whenData((feed) {
        if (feed != null) {
          _courseNameController.text = feed.course_name;
          _postController.text = feed.post;
        }
      });
    }


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
              onPressed: () async {
                final courseDB = ref.read(courseFeedDBProvider);
                final newFeed = CourseFeedData(
                  feed_id: feedId ?? DateTime.now().millisecondsSinceEpoch.toString(),
                  course_name: _courseNameController.text,
                  post: _postController.text,
                  student_id: currentUserID,
                );

                if (feedId == null) {
                  await courseDB.addCourseFeed(newFeed);
                } else {
                  await courseDB.updateCourseFeed(feedId!, newFeed);
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
