import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/groups.dart';
import '../Domain/groups_collection.dart';

final groupDBServiceProvider = Provider<GroupDBService>((ref) {
  return GroupDBService();
});

final groupProvider = FutureProvider.family<GroupData, String>((ref, groupId) async {
  return ref.read(groupDBServiceProvider).getGroupById(groupId);
});

final groupsForStudentProvider = StreamProvider.family<List<GroupData>, String>((ref, studentId) {
  return ref.read(groupDBServiceProvider).getGroupsForStudent(studentId);
});