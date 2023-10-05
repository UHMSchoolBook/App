import 'package:flutter/material.dart';

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
    return ListView(
      children: [
        FeedItem('Course 1', 'This is a course post.', 'a'),
        FeedItem('Course 2', 'Another course post here.', 'b'),
        FeedItem('Course 3', 'More course updates.', 'c'),
      ],
    );
  }
}

class ClubsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FeedItem('Club 1', 'This is a club post.', 'D'),
        FeedItem('Club 2', 'Another club post here.', 'E'),
        FeedItem('Club 3', 'More club updates.', 'F'),
      ],
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
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          // Display author's avatar
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(content),
            SizedBox(height: 15),
            Text('Posted by: $author'),
          ],
        ),
      ),
    );
  }
}