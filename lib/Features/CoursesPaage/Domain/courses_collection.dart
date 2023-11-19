import 'package:cloud_firestore/cloud_firestore.dart';
import 'courses.dart';

class ClassDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ClassData>> getClasses() {
    return _firestore.collection('classes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ClassData.fromJson(doc.data())).toList();
    });
  }
  Future<ClassData> getClassById(String classId) async {
    // Query the 'classes' collection for a document where 'class_id' field matches classId
    var querySnapshot = await _firestore.collection('classes')
        .where('class_id', isEqualTo: classId)
        .limit(1)
        .get();

    // Check if the query returned any documents
    if (querySnapshot.docs.isNotEmpty) {
      // Assuming the first document is the one we want
      var docSnapshot = querySnapshot.docs.first;
      return ClassData.fromJson(docSnapshot.data()!);
    } else {
      throw Exception('Class not found');
    }
  }
  Stream<List<ClassData>> getClassesForStudent(String studentId) {
    print("Fetching classes for studentId: $studentId");
    return _firestore.collection('classes')
        .where('student_ids', arrayContains: studentId)
        .snapshots()
        .map((snapshot) {
      // Log the raw snapshot data

      print("Classes snapshot data: ${snapshot.docs.map((doc) => doc.data()).toList()}");

      return snapshot.docs
          .map((doc) => ClassData.fromJson(doc.data()))
          .toList();
    });
  }
// Add other necessary methods like addClass, updateClass, deleteClass
}
final classDBService = ClassDBService();
