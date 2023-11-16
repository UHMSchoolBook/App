import 'package:cloud_firestore/cloud_firestore.dart';
import 'housesharing.dart';

class HouseSharingDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<HouseSharingData>> getRooms() {
    return _firestore.collection('houseSharing').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => HouseSharingData.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  Future<void> addRoom(HouseSharingData room) {
    return _firestore.collection('houseSharing').add(room.toJson());
  }

  Future<void> updateRoom(String roomId, HouseSharingData room) {
    return _firestore.collection('houseSharing').doc(roomId).update(room.toJson());
  }

  Future<HouseSharingData?> getRoomById(String roomId) async {
    try {
      var doc = await _firestore.collection('houseSharing').doc(roomId).get();
      if (doc.exists) {
        return HouseSharingData.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error getting room: $e');
    }
    return null;
  }
}
