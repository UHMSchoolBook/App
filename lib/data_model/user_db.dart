//import 'chapter_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// The data associated with users.
class UserData {
  UserData(
      {required this.id,
        required this.name,
        required this.email,
        required this.imagePath,
        required this.bio});

  String id;
  String name;
  String email;
  String imagePath;
  String bio;
}

/// Provides access to and operations on all defined users.
class UserDB {
  final List<UserData> _users = [
    UserData(
        id: 'user-001',
        name: 'Rahat',
        email: 'rahat@gmail.com',
        imagePath: 'https://scholar.googleusercontent.com/citations?view_op=view_photo&user=DRMNtvMAAAAJ&citpid=2',
        bio: 'I am a computer science masters student at UHManoa'),
    UserData(
        id: 'user-002',
        name: 'Armin',
        email: 'armin@gmail.com',
        imagePath: 'https://hawaiidigitalhealthlab.com/content/images/2023/06/armin.jpeg',
        bio: 'I am passionate about mobile application development'),
    UserData(
        id: 'user-003',
        name: 'John',
        email: 'john@gmail.com',
        imagePath: 'https://raw.githubusercontent.com/philipmjohnson/philipmjohnson.github.io/main/img/pmj-headshot.png',
        bio: 'I am passionate about teaching people about mobile apps'),
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  String getUserName(String userID) {
    return _users.firstWhere((userData) => userData.id == userID).name;
  }

  String getUserImagePath(String userID) {
    return _users.firstWhere((userData) => userData.id == userID).imagePath;
  }

  bool isUserEmail(String email) {
    List<String> emails = _users.map((userData) => userData.email).toList();
    return emails.contains(email);
  }

  String getUserIDByEmail(String email) {
    return _users.firstWhere((userData) => userData.email == email).id;
  }
}


/// The singleton instance providing access to all user data for clients.
UserDB userDB = UserDB();


final userDBProvider = Provider<UserDB>((ref) => UserDB());
final currentUserIDProvider = StateProvider<String?>((ref) => null);