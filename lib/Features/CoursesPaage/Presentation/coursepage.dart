import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Student_Profile_Page/Data/user_notifier.dart';
import '../../Student_Profile_Page/Domain/users_collection.dart';
import '../Data/coursesProvider.dart';
import '../Domain/courses.dart';

class CoursePage extends ConsumerWidget {
  final String classId;

  CoursePage({required this.classId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classDataAsyncValue = ref.watch(classProvider(classId));

    return classDataAsyncValue.when(
      data: (classData) => _buildCoursePageUI(classData, ref),
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
  }

  Widget _buildCoursePageUI(ClassData classData, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(classData.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Course Description:',
                style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 8.0),
              Text(
                classData.description,
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              SizedBox(height: 16.0),
              Text(
                'Instructor: ${classData.instructor}',
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(height: 8.0),
              Text(
                'Schedule: ${classData.schedule}',
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              SizedBox(height: 20.0),
              Divider(color: Colors.grey),
              Text(
                'Students:',
                style: TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 10.0),
              _buildStudentList(classData.student_ids, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentList(List<String> studentIds, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: studentIds.length,
      itemBuilder: (context, index) {
        final userId = studentIds[index];
        return ref.watch(userDataByEmailProvider(userId)).when(
          data: (userData) =>
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userData!.imagePath),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                    userData!.name, style: TextStyle(color: Colors.black87)),
              ),
          loading: () =>
              ListTile(leading: CircleAvatar(), title: Text('Loading...')),
          error: (e, st) =>
              ListTile(leading: CircleAvatar(), title: Text('Error: $e')),
        );
      },
    );
  }
}