//import 'chapter_db.dart';

/// The data associated with users.
class GroupData {
  GroupData({
    required this.group_id,
    required this.name,
    required this.student_ids,
    required this.description, // Add this line
  });

  String group_id;
  String name;
  List<String> student_ids;
  String description; // Add this line
}


/// Provides access to and operations on all defined users.
class GroupDB {
  final List<GroupData> _groups = [
    GroupData(
      group_id: 'group-001',
      name: 'Reading Group',
      student_ids: ['user-001', 'user-002'],
      description: 'A group for book lovers to discuss and share their favorite reads.', // Example description
    ),
    GroupData(
      group_id: 'group-002',
      name: 'Programming Club',
      student_ids: ['user-001', 'user-002'],
      description: 'A community of programming enthusiasts learning and sharing coding skills.', // Example description
    ),
    // Add more groups as needed
  ];

  List<GroupData> getGroupsForStudent(String studentId) {
    return _groups.where((group) => group.student_ids.contains(studentId)).toList();
  }

  GroupData getGroupById(String groupId) {
    return _groups.firstWhere((group) => group.group_id == groupId);
  }
}

/// The singleton instance providing access to all user data for clients.
GroupDB groupDB = GroupDB();


