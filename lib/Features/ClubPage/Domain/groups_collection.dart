import 'package:cloud_firestore/cloud_firestore.dart';

import 'groups.dart';

class GroupDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<GroupData> getGroupById(String groupId) async {
    var querySnapshot = await _firestore.collection('groups')
        .where('group_id', isEqualTo: groupId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var snapshot = querySnapshot.docs.first;
      print("Group Data for ID $groupId: ${snapshot.data()}");
      return GroupData.fromJson(snapshot.data()!);
    } else {
      print("No group found with group_id $groupId");
      throw Exception('Group not found');
    }
  }


  Stream<List<GroupData>> getGroupsForStudent(String studentId) {
    return _firestore.collection('groups')
        .where('student_ids', arrayContains: studentId)
        .snapshots()
        .map((snapshot) {
      snapshot.docs.forEach((doc) {
        print("Group Data: ${doc.data()}");
      });
      return snapshot.docs
          .map((doc) => GroupData.fromJson(doc.data()))
          .toList();
    });
  }
}