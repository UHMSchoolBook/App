import 'package:flutter/material.dart';
import '../Components/bottom_navigation_bar.dart';
import '../Feed/feed.dart';
import '../data_model/user_db.dart';
import '../data_model/courses_db.dart';
import '../data_model/groups_db.dart';

UserData data = userDB.getUser(currentUserID);
List<String> classes = classDB.getClassesForStudent(currentUserID);
List<String> groups = groupDB.getGroupForStudent(currentUserID);
class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  int _selectedIndex = 0;

  // Function to update _selectedIndex
  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.lightGreen, // Color for bio section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Bio:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.bio,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Courses:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      // Handle course click action
                    },
                    child: CourseItem(classes[0], Colors.green),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle course click action
                    },
                    child: CourseItem(classes[1], Colors.orange),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Groups:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      // Handle group click action
                    },
                    child: GroupItem(groups[0], Colors.red),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle group click action
                    },
                    child: GroupItem(groups[1], Colors.purple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class CourseItem extends StatelessWidget {
  final String courseName;
  final Color color;

  CourseItem(this.courseName, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        title: Text(courseName),
      ),
    );
  }
}

class GroupItem extends StatelessWidget {
  final String groupName;
  final Color color;

  GroupItem(this.groupName, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        title: Text(groupName),
      ),
    );
  }
}


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue, // Customize the background color
      elevation: 0,
      centerTitle: false,
      bottom: PreferredSize(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu), // Burger menu icon
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  SizedBox(width: 8.0),
                  CircleAvatar(
                    backgroundImage: NetworkImage(data.imagePath), // Profile picture
                    radius: 50,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    data.name, // User's name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.notifications), // Notifications icon
                onPressed: () {
                  // Handle notifications action
                },
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(60), // Height of the bottom AppBar section
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 60.0);
}


