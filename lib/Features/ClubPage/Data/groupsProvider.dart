import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Domain/groups_db.dart';

final groupDBProvider = Provider<GroupDB>((ref) {
  return GroupDB();
});