import 'package:connect_people/Features/Student_Profile_Page/Domain/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/users_collection.dart';

// Provider for UserDB
final userDBProvider = Provider<UserDB>((ref) => UserDB());

// StateProvider for current user ID
// final userDBProvider = Provider<UserData>((ref) => UserData());
final currentUserIDProvider = StateProvider<String?>((ref) => null);

// FutureProvider for UserData
final userDataProvider = FutureProvider.family<UserData, String>((ref, userId) async {
  final userDB = ref.watch(userDBProvider); // Use UserDB instance
  return userDB.getUser(userId); // Fetch user data using UserDB
});
final userDataByEmailProvider = FutureProvider.family<UserData, String>((ref, email) async {
  final userDB = ref.watch(userDBProvider);
  String userId = await userDB.getUserIDByEmail(email);
  return userDB.getUser(userId);
});
final userEmailProvider = FutureProvider.family<String, String>((ref, userId) async {
  final userDB = ref.read(userDBProvider);
  return await userDB.getUserEmailById(userId);
});
