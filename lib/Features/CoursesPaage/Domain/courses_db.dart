//import 'chapter_db.dart';

/// The data associated with users.
class ClassData {
  ClassData({
    required this.class_id,
    required this.name,
    required this.student_ids,
    required this.description,
    required this.instructor,
    required this.schedule,
  });

  String class_id;
  String name;
  List<String> student_ids;
  String description;
  String instructor;
  String schedule; // Assuming schedule is a string for simplicity
}

class ClassDB {
  final List<ClassData> _classes = [
    ClassData(
      class_id: 'class-001',
      name: 'Introduction to Programming',
      student_ids: ['user-001', 'user-002'],
      description: 'Learn the basics of programming.',
      instructor: 'Philip',
      schedule: 'Mondays and Wednesdays, 10:00 - 12:00',
    ),
    ClassData(
      class_id: 'class-002',
      name: 'Introduction to Algorithms',
      student_ids: ['user-001', 'user-002'],
      description: 'Learn the basics of algorithms.',
      instructor: 'John',
      schedule: 'Mondays and Wednesdays, 10:00 - 12:00',
    ),
  ];

  List<ClassData> getClassesForStudent(String studentId) {
    List<ClassData> classes = [];
    for (var classData in _classes) {
      if (classData.student_ids.contains(studentId)) {
        classes.add(classData);
      }
    }
    return classes;
  }
}

/// The singleton instance providing access to all user data for clients.
ClassDB classDB = ClassDB();

