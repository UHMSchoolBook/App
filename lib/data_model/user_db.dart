//import 'chapter_db.dart';

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
        bio: 'I am a computer science masters student at UHM'),
    UserData(
        id: 'user-002',
        name: 'Armin',
        email: 'armin@gmail.com',
        imagePath: 'https://hawaiidigitalhealthlab.com/content/images/2023/06/armin.jpeg',
        bio: 'I am passionate about programming'),
    UserData(
        id: 'user-003',
        name: 'John',
        email: 'john@gmail.com',
        imagePath: 'https://raw.githubusercontent.com/philipmjohnson/philipmjohnson.github.io/main/img/pmj-headshot.png',
        bio: 'I am passionate about mobile apps'),
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  List<UserData> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }

  // Return the userIDs of users who are in the same Chapter(s) as [userID].
  // First, get all of the chapterIDs that this [userID] is associated with.
  // Then build the set of all userIDs associated with the chapterIDs.

}

/// The singleton instance providing access to all user data for clients.
UserDB userDB = UserDB();

