import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import '../Domain/coursefeed_db.dart';
import '../Domain/clubfeed_db.dart';
import 'package:connect_people/Feed/Presentation/edit_feed.dart';
import 'package:connect_people/Feed/Presentation/edit_cfeed.dart';
import 'package:connect_people/Student_Profile_Page/Data/user_notifier.dart';
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
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state?? '';
    final courseDB = ref.watch(CourseFeedDBProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: courseDB.feeds.length,
        itemBuilder: (context, index) {
          return FeedItem(
            feedId: courseDB.feeds[index].feed_id,
            title: courseDB.feeds[index].course_name,
            content: courseDB.feeds[index].post,
            author: courseDB.feeds[index].student_id,
            isCourseFeed: true,
            currentUserId: currentUserID,
          );
        },
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
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state?? '';
    final clubDB = ref.watch(ClubFeedDBProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: clubDB.cfeeds.length,
        itemBuilder: (context, index) {
          return FeedItem(
            feedId: clubDB.cfeeds[index].feed_id,
            title: clubDB.cfeeds[index].club_name,
            content: clubDB.cfeeds[index].post,
            author: clubDB.cfeeds[index].student_id,
            isCourseFeed: false,
            currentUserId: currentUserID,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditCFeedPage(), // Navigate to the EditCFeedPage when pressed
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

