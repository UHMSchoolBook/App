import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import '../Domain/clubfeed_collection.dart';
import 'package:connect_people/Features/Feed/Presentation/edit_feed.dart';
import 'package:connect_people/Features/Feed/Presentation/edit_cfeed.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/Feed/Data/feed_notifier.dart';
import 'package:connect_people/Features/Feed/Data/cfeed_notifier.dart';
class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: 'Courses'),
              Tab(text: 'Clubs'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CoursesTab(),
            ClubsTab(),
          ],
        ),
      ),
    );
  }
}

class CoursesTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    final courseFeedsAsyncValue = ref.watch(courseFeedsStreamProvider);

    return Scaffold(
      body: courseFeedsAsyncValue.when(
        data: (courseFeeds) => ListView.builder(
          itemCount: courseFeeds.length,
          itemBuilder: (context, index) {
            final feed = courseFeeds[index];
            return FeedItem(
              feedId: feed.feed_id,
              title: feed.course_name,
              content: feed.post,
              author: feed.student_id,
              isCourseFeed: true,
              currentUserId: currentUserID,
            );
          },
        ),
        loading: () => CircularProgressIndicator(),
        error: (e, st) => Text('Error: $e'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditFeedPage(),
          ));
        },
      ),
    );
  }
}



class ClubsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    final clubFeedsAsyncValue = ref.watch(clubFeedsStreamProvider);

    return Scaffold(
      body: clubFeedsAsyncValue.when(
        data: (clubFeeds) => ListView.builder(
          itemCount: clubFeeds.length,
          itemBuilder: (context, index) {
            final feed = clubFeeds[index];
            return FeedItem(
              feedId: feed.feed_id,
              title: feed.club_name,
              content: feed.post,
              author: feed.student_id,
              isCourseFeed: false,
              currentUserId: currentUserID,
            );
          },
        ),
        loading: () => CircularProgressIndicator(),
        error: (e, st) => Text('Error: $e'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditCFeedPage(),
          ));
        },
      ),
    );
  }
}




class FeedItem extends StatelessWidget {
  final String title;
  final String content;
  final String author;
  final String feedId;
  final bool isCourseFeed;
  final String currentUserId;

  FeedItem({
    required this.feedId,
    required this.title,
    required this.content,
    required this.author,
    required this.isCourseFeed,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userDB.getUserImagePath(author)),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content),
            SizedBox(height: 20),
            Text('Posted by: ${userDB.getUserName(author)}'),
          ],
        ),
        trailing: (currentUserId == author) ? PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              if (isCourseFeed) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditFeedPage(feedId: feedId),
                ));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditCFeedPage(feedId: feedId),
                ));
              }
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'edit',
              child: Text('Edit'),
            ),
          ],
        ) : null,
      ),
    );
  }
}

