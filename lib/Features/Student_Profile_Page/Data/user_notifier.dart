import 'package:connect_people/Features/Student_Profile_Page/Domain/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDBProvider = Provider<UserDB>((ref) => UserDB());
final currentUserIDProvider = StateProvider<String?>((ref) => null);