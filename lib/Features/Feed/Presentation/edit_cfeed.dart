import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/clubfeed.dart';
import '../Domain/clubfeed_collection.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/Feed/Data/cfeed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/clubfeed.dart';
import '../Domain/clubfeed_collection.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/Feed/Data/cfeed_notifier.dart';

class EditCFeedPage extends ConsumerWidget {
  final String? feedId;

  EditCFeedPage({this.feedId});

  final TextEditingController _clubNameController = TextEditingController();
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clubFeedDB = ref.read(clubFeedDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    // Initialize controllers if feedId is not null
    if (feedId != null) {
      final clubFeedDataAsyncValue = ref.watch(clubFeedByIdProvider(feedId!));
      clubFeedDataAsyncValue.whenData((feed) {
        if (feed != null) {
          _clubNameController.text = feed.club_name;
          _postController.text = feed.post;
        }
      });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(feedId == null ? 'Add Club Feed' : 'Edit Club Feed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildForm(context, clubFeedDB, currentUserID),
      ),
    );
  }

  Widget _buildForm(BuildContext context, ClubFeedDB clubFeedDB, String currentUserID) {
    return Column(
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
          onPressed: () => _handleSave(context, clubFeedDB, currentUserID),
          child: Text(feedId == null ? 'Add' : 'Update'),
        ),
      ],
    );
  }

  void _handleSave(BuildContext context, ClubFeedDB clubFeedDB, String currentUserID) {
    final newFeed = ClubFeedData(
      feed_id: feedId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      club_name: _clubNameController.text,
      post: _postController.text,
      student_id: currentUserID,
    );

    if (feedId == null) {
      clubFeedDB.addFeed(newFeed);
    } else {
      clubFeedDB.updateFeed(feedId!, newFeed);
    }

    Navigator.of(context).pop();
  }
}

