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
  Future<List<GroupData>> searchGroups(String query) async {
    var querySnapshot = await _firestore.collection('groups')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    return querySnapshot.docs
        .map((doc) => GroupData.fromJson(doc.data()))
        .toList();
  }

  Future<void> removeUserFromGroup(String groupId, String userId) async {
    var querySnapshot = await _firestore.collection('groups')
        .where('group_id', isEqualTo: groupId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception("Group not found");
    }

    DocumentReference groupDocRef = querySnapshot.docs.first.reference;

    return _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(groupDocRef);

      List<String> studentIds = List<String>.from(snapshot.get('student_ids'));
      studentIds.remove(userId);

      transaction.update(groupDocRef, {'student_ids': studentIds});
    });
  }


  Future<void> addUserToGroup(String groupId, String userId) async {
    var querySnapshot = await _firestore.collection('groups')
        .where('group_id', isEqualTo: groupId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception("Group not found");
    }

    DocumentReference groupDocRef = querySnapshot.docs.first.reference;

    return _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(groupDocRef);

      List<String> studentIds = List<String>.from(snapshot.get('student_ids'));
      if (!studentIds.contains(userId)) {
        studentIds.add(userId);
      }

      transaction.update(groupDocRef, {'student_ids': studentIds});
    });
  }



}