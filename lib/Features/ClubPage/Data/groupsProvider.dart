
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/groups.dart';
import '../Domain/groups_collection.dart';

final groupDBServiceProvider = Provider<GroupDBService>((ref) {
  return GroupDBService();
});

final groupProvider = FutureProvider.family<GroupData, String>((ref, groupId) async {
  ref.watch(refreshProvider);
  return ref.read(groupDBServiceProvider).getGroupById(groupId);
});

final groupsForStudentProvider = StreamProvider.family<List<GroupData>, String>((ref, studentId) {
  return ref.read(groupDBServiceProvider).getGroupsForStudent(studentId);
});

final groupsSearchProvider = StateNotifierProvider<GroupsSearchNotifier, List<GroupData>>((ref) {
  return GroupsSearchNotifier(ref);
});


class GroupsSearchNotifier extends StateNotifier<List<GroupData>> {
  final Ref ref;

  GroupsSearchNotifier(this.ref) : super([]);

  void search(String query) async {
    if (query.isEmpty) {
      state = [];
      return;
    }

    try {
      final groups = await ref.read(groupDBServiceProvider).searchGroups(query);
      state = groups;
    } catch (e) {
      // Handle errors, maybe by setting state to an empty list or logging the error
      state = [];
      print('Error searching groups: $e');
    }
  }
}

final refreshProvider = StateProvider<bool>((ref) => false);

