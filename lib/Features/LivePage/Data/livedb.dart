import 'package:cloud_firestore/cloud_firestore.dart';
import '../Domain/live.dart';

class LiveDB {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<Live>> getLivesByMajor(String targetMajor) async {
    QuerySnapshot querySnapshot = await firestore.collection('lives').where('major', isEqualTo: targetMajor).get();
    return querySnapshot.docs
        .map((doc) => Live.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}