import 'package:flutter/material.dart';

class Person {
  final String name;
  final String songImageUrl;
  final String major;
  final String gender;
  final String distance;
  final String imageUrl;

  Person({
    required this.name,
    required this.songImageUrl,
    required this.major,
    required this.gender,
    required this.distance,
    required this.imageUrl,
  });
}

class LiveActivityPage extends StatefulWidget {
  @override
  _LiveActivityPageState createState() => _LiveActivityPageState();
}

class _LiveActivityPageState extends State<LiveActivityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _tabs = ['Songs', 'Movies', 'Games', 'Books', 'Events'];
  List<Person> _people = [
    Person(name: 'Philip', songImageUrl: 'https://i.ytimg.com/vi/xXD5tltX9Pg/maxresdefault.jpg', major: 'CS', gender: 'Male', distance: '2 km', imageUrl: 'https://raw.githubusercontent.com/philipmjohnson/philipmjohnson.github.io/main/img/pmj-headshot.png'),
    Person(name: 'Sara', songImageUrl: 'https://www.moroccoworldnews.com/wp-content/uploads/2022/12/this-time-for-africa-shakira-celebrates-moroccos-win-800x450.jpeg', major: 'Physics', gender: 'Female', distance: '5 km', imageUrl: 'https://cdn.britannica.com/47/188647-050-396A58A5/Sarah-Silverman-2011.jpg'),
    Person(name: 'Armin', songImageUrl: 'https://m.media-amazon.com/images/M/MV5BMTM2NzE1YTEtNTNjZC00MTg5LTkwOTEtNDEwMDI1ODA1YjhkXkEyXkFqcGdeQXVyNjU0ODAyOTY@._V1_.jpg', major: 'CS', gender: 'Male', distance: '1 km', imageUrl: "https://hawaiidigitalhealthlab.com/content/images/2023/06/armin.jpeg"),
    Person(name: "Rahat", songImageUrl: "https://upload.wikimedia.org/wikipedia/en/d/d6/Lose_Yourself.jpg", major: "math", gender: 'Male', distance: '5 km', imageUrl: "https://scholar.googleusercontent.com/citations?view_op=view_photo&user=DRMNtvMAAAAJ&citpid=2"),
    // Add other people here
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Activity'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return ListView.builder(
            itemCount: _people.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  _people[index].songImageUrl,
                  width: 50,  // you can adjust the width as you need
                  height: 50, // and also the height
                  fit: BoxFit.cover,  // this is to ensure that the image scales correctly
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_people[index].name),
                    Text(_people[index].major),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(_people[index].gender),
                    SizedBox(width: 10),
                    Text(_people[index].distance),
                  ],
                ),
                trailing: CircleAvatar(
                  backgroundImage: NetworkImage(
                    _people[index].imageUrl,
                  ),
                ),
              );
            },
          );

        }).toList(),
      ),
    );
  }
}
