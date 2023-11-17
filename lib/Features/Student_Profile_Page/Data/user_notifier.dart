import 'package:connect_people/Features/Student_Profile_Page/Domain/user_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDBProvider = Provider<UserData>((ref) => UserData());
final currentUserIDProvider = StateProvider<String?>((ref) => null);