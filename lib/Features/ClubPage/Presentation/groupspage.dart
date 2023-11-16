import 'package:flutter/material.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import '../Domain/groups_db.dart';

class GroupDetailPage extends StatelessWidget {
  final GroupData groupData;

  GroupDetailPage({required this.groupData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupData.name),
        backgroundColor: Colors.deepPurple, // Custom color for AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Group Description:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 8.0),
              Text(
                groupData.description,
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              SizedBox(height: 20.0),
              Divider(color: Colors.grey),
              Text(
                'Members:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              SizedBox(height: 10.0),
              _buildStudentList(groupData.student_ids),
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
