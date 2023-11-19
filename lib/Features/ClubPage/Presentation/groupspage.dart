import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data/groupsProvider.dart';
import '../Domain/groups.dart';

class GroupDetailPage extends ConsumerWidget {
  final String groupId;

  GroupDetailPage({required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupAsyncValue = ref.watch(groupProvider(groupId));

    return Scaffold(
      appBar: AppBar(
        title: groupAsyncValue.when(
          data: (groupData) => Text(groupData.name),
          loading: () => Text('Loading...'),
          error: (e, st) => Text('Error'),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: groupAsyncValue.when(
        data: (groupData) => buildGroupDetails(context, ref, groupData),
        loading: () => CircularProgressIndicator(),
        error: (e, st) => Text('Error: $e'),
      ),
    );
  }

  Widget buildGroupDetails(BuildContext context, WidgetRef ref, GroupData groupData) {
    return SingleChildScrollView(
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
            _buildStudentList(ref, groupData.student_ids),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentList(WidgetRef ref, List<String> studentIds) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: studentIds.length,
      itemBuilder: (context, index) {
        final studentAsyncValue = ref.watch(userDataByEmailProvider(studentIds[index])); // Assuming you have a userProvider

        return studentAsyncValue.when(
          data: (studentData) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(studentData!.imagePath),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              studentData!.name,
              style: TextStyle(color: Colors.black87),
            ),
          ),
          loading: () => ListTile(
            leading: CircleAvatar(),
            title: Text('Loading...'),
          ),
          error: (e, st) => ListTile(
            leading: CircleAvatar(),
            title: Text('Error: $e'),
          ),
        );
      },
    );
  }
}
