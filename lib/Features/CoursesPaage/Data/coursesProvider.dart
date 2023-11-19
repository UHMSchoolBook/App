import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Domain/courses.dart';
import '../Domain/courses_collection.dart';

final classDBServiceProvider = Provider<ClassDBService>((ref) {
  return ClassDBService();
});

final classProvider = FutureProvider.family<ClassData, String>((ref, classId) async {
  return ref.read(classDBServiceProvider).getClassById(classId);
});

final classesForStudentProvider = StreamProvider.family<List<ClassData>, String>((ref, studentId) {
  return ref.read(classDBServiceProvider).getClassesForStudent(studentId);
});
