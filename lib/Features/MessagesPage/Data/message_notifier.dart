import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/message.dart';  // Adjust the import path as needed

class MessageNotifier extends StateNotifier<List<MessageData>> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  MessageNotifier() : super([]) {
    _initializeMessages();
  }

  Future<void> _initializeMessages() async {
    firestore.collection('messages').snapshots().listen((snapshot) {
      state = snapshot.docs
          .map((doc) => MessageData.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> addMessage(MessageData message) async {
    await firestore.collection('messages').add(message.toJson());
  }
}

final messageProvider = StateNotifierProvider<MessageNotifier, List<MessageData>>((ref) => MessageNotifier());
