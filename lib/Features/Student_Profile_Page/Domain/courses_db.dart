//import 'chapter_db.dart';

/// The data associated with users.
class ClassData {
  ClassData(
      {required this.class_id,
        required this.name,
        required this.student_ids,});

  String class_id;
  String name;
  List<String> student_ids;
}

/// Provides access to and operations on all defined users.
class ClassDB {
  final List<ClassData> _classes = [
    ClassData(
        class_id: 'class-001',
        name: 'Introduction to Programming',
        student_ids: ['user-001','user-002']),
    ClassData(
        class_id: 'class-002',
        name: 'Data Structure and Algorithms',
        student_ids: ['user-001','user-002']),
  ];

  List<String> getClassesForStudent(String studentId) {
    List<String> classNames = [];
    for (var classData in _classes) {
      if (classData.student_ids.contains(studentId)) {
        classNames.add(classData.name);
      }
    }
    return classNames;
  }
}

/// The singleton instance providing access to all user data for clients.
ClassDB classDB = ClassDB();

