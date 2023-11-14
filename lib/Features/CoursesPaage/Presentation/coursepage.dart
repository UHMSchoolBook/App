import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import '../Domain/courses_db.dart';

class CoursePage extends StatelessWidget {
  final ClassData courseData;

  CoursePage({required this.courseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseData.name),
        backgroundColor: Colors.deepPurple, // Custom color for AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Course Description:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 8.0),
              Text(
                courseData.description,
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              SizedBox(height: 16.0),
              Text(
                'Instructor: ${courseData.instructor}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              SizedBox(height: 8.0),
              Text(
                'Schedule: ${courseData.schedule}',
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              SizedBox(height: 20.0),
              Divider(color: Colors.grey),
              Text(
                'Students:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 10.0),
              _buildStudentList(courseData.student_ids),
            ],

          ),
        ),
      ),
    );
  }

  Widget _buildStudentList(List<String> studentIds) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: studentIds.length,
      itemBuilder: (context, index) {
        UserData studentData = userDB.getUser(studentIds[index]);
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(studentData.imagePath),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            studentData.name,
            style: TextStyle(color: Colors.black87),
          ),
        );
      },
    );
  }
}
