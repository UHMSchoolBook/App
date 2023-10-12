import 'package:flutter/material.dart';
import '../data_model/user_db.dart';
import '../data_model/coursefeed_db.dart';
import '../data_model/clubfeed_db.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu), // Burger menu icon
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text('Feed'),
          bottom: TabBar(
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

class CoursesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coursefeedDB.feeds.length,
      itemBuilder: (context, index) {
        return FeedItem(
          coursefeedDB.feeds[index].course_name,
          coursefeedDB.feeds[index].post,
          coursefeedDB.feeds[index].student_id,
        );
      },
    );
  }
}

class ClubsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubfeedDB.cfeeds.length,
      itemBuilder: (context, index) {
        return FeedItem(
          clubfeedDB.cfeeds[index].club_name,
          clubfeedDB.cfeeds[index].post,
          clubfeedDB.cfeeds[index].student_id,
        );
      },
    );
  }
}

class FeedItem extends StatelessWidget {
  final String title;
  final String content;
  final String author;

  FeedItem(this.title, this.content, this.author);

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
      ),
    );
  }
}