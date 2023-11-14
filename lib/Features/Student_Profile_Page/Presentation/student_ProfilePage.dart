import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ClubPage/Data/groupsProvider.dart';
import '../../ClubPage/Presentation/groupspage.dart';
import '../../Common/bottom_navigation_bar.dart';
import '../../CoursesPaage/Presentation/coursepage.dart';
import '../../CoursesPaage/Data/coursesProvide.dart';
import '../../Feed/Presentation/feed.dart';
import '../Domain/user_db.dart';
import '../../CoursesPaage/Domain/courses_db.dart';
import '../../ClubPage/Domain/groups_db.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';


class StudentProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classDB = ref.watch(classDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state;

    if (currentUserID == null) {
      return Scaffold(body: Center(child: Text("No user logged in")));
    }

    final groupDB = ref.watch(groupDBProvider);
    List<GroupData> groups = groupDB.getGroupsForStudent(currentUserID);

    UserData data = userDB.getUser(currentUserID);
    List<ClassData> classes = classDB.getClassesForStudent(currentUserID);

    return Scaffold(
      appBar: MyAppBar(data: data),
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
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  for (var classData in classes)
                    CourseItem(classData),
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
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  for (var groupData in groups)
                    GroupItem(groupData),
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
  final ClassData courseData;

  CourseItem(this.courseData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(courseData: courseData),
          ),
        );
      },
      child: Container(
        color: Colors.lightBlue, // or any other color
        child: ListTile(
          title: Text(courseData.name),
          subtitle: Text(courseData.description), // Assuming description is added
        ),
      ),
    );
  }
}

class GroupItem extends StatelessWidget {
  final GroupData groupData;

  GroupItem(this.groupData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupDetailPage(groupData: groupData),
          ),
        );
      },
      child: Container(
        color: Colors.lightGreen, // or any other color
        child: ListTile(
          title: Text(groupData.name),
          subtitle: Text(groupData.description), // Assuming description is added
        ),
      ),
    );
  }
}



class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserData data;

  MyAppBar({required this.data});

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


