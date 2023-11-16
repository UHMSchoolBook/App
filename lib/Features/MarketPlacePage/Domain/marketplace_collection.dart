// marketplace_db.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'marketplace.dart';

class MarketPlaceDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<MarketPlaceData>> getItems() {
    return _firestore.collection('marketplace').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => MarketPlaceData.fromJson(doc.data())).toList();
    });
  }

  Future<void> addItem(MarketPlaceData item) {
    return _firestore.collection('marketplace').add(item.toJson());
  }

  Future<void> updateItem(String itemId, MarketPlaceData item) {
    return _firestore.collection('marketplace').doc(itemId).update(item.toJson());
  }

  Future<MarketPlaceData?> getItemById(String itemId) async {
    var doc = await _firestore.collection('marketplace').doc(itemId).get();
    if (doc.exists) {
      return MarketPlaceData.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
