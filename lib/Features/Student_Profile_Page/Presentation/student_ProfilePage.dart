import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ClubPage/Data/groupsProvider.dart';
import '../../ClubPage/Domain/groups.dart';
import '../../ClubPage/Presentation/groupspage.dart';
import '../../CoursesPaage/Presentation/coursepage.dart';
import '../../CoursesPaage/Data/coursesProvider.dart';
import '../../MessagesPage/Domain/message.dart';
import '../Domain/user_db.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';

import '../../CoursesPaage/Domain/courses.dart';

class StudentProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classDB = ref.watch(classDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state;
    final firebaseProvider = ChangeNotifierProvider((ref) => FirebaseProvider());

    final userDataProvider = FutureProvider.family<UserData?, String>((ref, userId) async {
      return ref.read(firebaseProvider).getUserById(userId);
    });

    if (currentUserID == null || currentUserID.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("No User ID")),
        body: Center(child: Text("Please log in to view your profile.")),
      );
    }

    final userDataAsyncValue = ref.watch(userDataProvider(currentUserID));

    return userDataAsyncValue.when(
      data: (userData) {
        if (userData == null) {
          return Scaffold(body: Center(child: Text("User not found")));
        }

    // Use groupsForStudentProvider here
    final groupsAsyncValue = ref.watch(groupsForStudentProvider(currentUserID));
        // Now use userData to build your UI
        final groups = ref.watch(groupDBProvider).getGroupsForStudent(currentUserID);
        final classes = classDB.getClassesForStudent(currentUserID);

        return buildUserProfilePage(userData, groups, classes);
      },
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text("Error: $e"))),
    );
  }

  Widget buildUserProfilePage(UserData data, List<GroupData> groups, List<ClassData> classes) {
    return Scaffold(
      body: userDataAsyncValue.when(
        data: (userData) => buildProfilePage(userData, ref, context),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Failed to load data', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ref.refresh(userDataProvider(currentUserID)),
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfilePage(UserData userData, WidgetRef ref, BuildContext context) {
    final currentUserID = ref.watch(currentUserIDProvider);
    final userEmailAsyncValue = ref.watch(userEmailProvider(currentUserID!));

    return userEmailAsyncValue.when(
      data: (email) {
        final groupsAsyncValue = ref.watch(groupsForStudentProvider(email));
        final classesAsyncValue = ref.watch(classesForStudentProvider(email));

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeaderSection(userData),
              buildBioSection(userData),
              buildCoursesSection(classesAsyncValue),
              buildGroupsSection(groupsAsyncValue),
            ],
          ),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text('Error loading user email'),
    );
  }
  Widget buildHeaderSection(UserData userData) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      color: Colors.blueAccent,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userData.imagePath),
            radius: 50,
          ),
          SizedBox(width: 16.0),
          Text(
            userData.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildBioSection(UserData userData) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.lightGreen, // Color for bio section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bio:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userData.bio,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCoursesSection(AsyncValue<List<ClassData>> classesAsyncValue) {
    return classesAsyncValue.when(
      data: (classes) => Container(
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
              CourseItem(classData: classData), // Pass the entire classData
          ],
        ),
      ),
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text("$e"),
    );
  }

  Widget buildGroupsSection(AsyncValue<List<GroupData>> groupsAsyncValue) {
    return groupsAsyncValue.when(
      data: (groups) => Container(
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
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text("$e"),
    );
  }



}

class CourseItem extends StatelessWidget {
  final ClassData classData;

  CourseItem({required this.classData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Print the classId being passed
        print("Navigating to CoursePage with classId: ${classData.class_id}");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoursePage(classId: classData.class_id),
          ),
        );
      },
      child: Container(
        color: Colors.lightBlue, // or any other color
        child: ListTile(
          title: Text(classData.name),
          subtitle: Text(classData.description),
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
            // Pass the groupId to GroupDetailPage
            builder: (context) => GroupDetailPage(groupId: groupData.group_id),
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
