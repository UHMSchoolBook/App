import 'package:connect_people/Features/LivePage/Data/livedb.dart';
import 'package:flutter/material.dart';
import '../Domain/live.dart';

class LiveActivityPage extends StatefulWidget {
  @override
  _LiveActivityPageState createState() => _LiveActivityPageState();
}

class _LiveActivityPageState extends State<LiveActivityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // Using tabs directly from liveDB instance.
  final List<String> _tabs = LiveDB.tabs;
  // Using the lives data from liveDB instance.
  final List<Live> _people = [];
  final LiveDB liveDB = LiveDB();

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
    // Remaining Flutter UI code, unmodified...
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
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
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
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
