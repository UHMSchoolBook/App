import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/clubfeed_db.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/Feed/Data/cfeed_notifier.dart';
class EditCFeedPage extends ConsumerWidget {
  final String? feedId;

  EditCFeedPage({this.feedId});

  final TextEditingController _clubNameController = TextEditingController();
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clubFeedDB = ref.read(ClubFeedDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state?? '';
    if (feedId != null) {
      final feed = clubFeedDB.cfeeds.firstWhere((f) => f.feed_id == feedId);
      _clubNameController.text = feed.club_name;
      _postController.text = feed.post;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(feedId == null ? 'Add Club Feed' : 'Edit Club Feed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _clubNameController,
              decoration: InputDecoration(labelText: 'Club Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _postController,
              decoration: InputDecoration(labelText: 'Post'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (feedId == null) {
                  clubFeedDB.addClubFeed(
                    feed_id: 'feed-${(clubFeedDB.cfeeds.length + 1).toString().padLeft(2, '0')}',
                    club_name: _clubNameController.text,
                    post: _postController.text,
                    student_id: currentUserID, // This should be the current user's ID
                  );
                } else {
                  clubFeedDB.updateClubFeed(
                    feed_id: feedId!,
                    club_name: _clubNameController.text,
                    post: _postController.text,
                    student_id: currentUserID, // This should be the current user's ID
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
