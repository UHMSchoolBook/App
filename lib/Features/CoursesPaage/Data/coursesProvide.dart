import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/courses_db.dart';
final classDBProvider = Provider<ClassDB>((ref) {
  return ClassDB();
});
