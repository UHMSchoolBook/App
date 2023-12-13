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
    final refresh = ref.watch(refreshProvider);
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
    final currentUserID = ref.watch(currentUserIDProvider);
    final userEmailAsyncValue = ref.watch(userEmailProvider(currentUserID!));
    final refresh = ref.watch(refreshProvider);
    return userEmailAsyncValue.when(
      data: (userEmail) => _buildGroupDetailsWithData(context, ref, groupData, userEmail),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildGroupDetailsWithData(BuildContext context, WidgetRef ref, GroupData groupData, String userEmail) {
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
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => isUserMember(groupData.student_ids, userEmail)
                  ? _leaveGroup(context, ref, groupData, userEmail)
                  : _joinGroup(context, ref, groupData, userEmail),
              child: Text(isUserMember(groupData.student_ids, userEmail) ? 'Leave Group' : 'Join Group'),
            ),
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
  bool isUserMember(List<String> memberIds, String? userId) {
    if (userId == null) {
      print("User ID is null");
      return false;
    }

    // Debugging: Print values to check
    print("Checking membership for user ID: $userId");
    print("Current member IDs: $memberIds");

    return memberIds.contains(userId);
  }


  void _leaveGroup(BuildContext context, WidgetRef ref, GroupData groupData, String? userId) async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User ID is null")));
      return;
    }

    try {
      await ref.read(groupDBServiceProvider).removeUserFromGroup(groupData.group_id, userId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Left the group successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error leaving group: $e")));
    }
    ref.refresh(groupProvider(groupData.group_id));
  }

  void _joinGroup(BuildContext context, WidgetRef ref, GroupData groupData, String? userId) async {
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User ID is null")));
      return;
    }

    try {
      await ref.read(groupDBServiceProvider).addUserToGroup(groupData.group_id, userId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Joined the group successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error joining group: $e")));
    }
    ref.refresh(groupProvider(groupData.group_id));
  }
}

