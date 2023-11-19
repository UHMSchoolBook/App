import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_people/Features/Student_Profile_Page/Domain/user_db.dart';

class UserDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserData> getUser(String userID) async {
    var snapshot = await _firestore.collection('users').doc(userID).get();
    return UserData.fromJson(snapshot.data()!);
  }
  Future<String> getUserIDByEmail(String email) async {
    var snapshot = await _firestore.collection('users').where('email', isEqualTo: email).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.id; // Assuming the user ID is the document ID
    }
    throw Exception('User not found');
  }
  Future<String> getUserEmailById(String userID) async {
    var snapshot = await _firestore.collection('users').doc(userID).get();
    if (snapshot.exists && snapshot.data() != null) {
      return snapshot.data()!['email']; // Assuming 'email' is the field for the user's email
    } else {
      throw Exception('User not found');
    }
  }

  Future<String> getUserName(String userID) async {
    var snapshot = await _firestore.collection('users').doc(userID).get();
    if (snapshot.exists && snapshot.data() != null) {
      return snapshot.data()!['name']; // Assuming 'name' is the field for the user's name
    } else {
      throw Exception('User not found');
    }
  }
  Future<String> getUserImagePath(String userID) async {
    var snapshot = await _firestore.collection('users').doc(userID).get();
    if (snapshot.exists && snapshot.data() != null) {
      return snapshot.data()!['imagePath']; // Assuming 'imagePath' is the field
    } else {
      throw Exception('User not found');
    }
  }
// Add other methods as needed
}
