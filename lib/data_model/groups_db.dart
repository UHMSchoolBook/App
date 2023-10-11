//import 'chapter_db.dart';

/// The data associated with users.
class GroupData {
  GroupData(
      {required this.group_id,
        required this.name,
        required this.student_ids,});

  String group_id;
  String name;
  List<String> student_ids;
}

/// Provides access to and operations on all defined users.
class GroupDB {
  final List<GroupData> _groups = [
    GroupData(
        group_id: 'class-001',
        name: 'Reading Group',
        student_ids: ['user-001','user-002']),
    GroupData(
        group_id: 'class-002',
        name: 'Programming Club',
        student_ids: ['user-001','user-002']),
  ];

  List<String> getGroupForStudent(String studentId) {
    List<String> groupNames = [];
    for (var groupData in _groups) {
      if (groupData.student_ids.contains(studentId)) {
        groupNames.add(groupData.name);
      }
    }
    return groupNames;
  }
}

/// The singleton instance providing access to all user data for clients.
GroupDB groupDB = GroupDB();

