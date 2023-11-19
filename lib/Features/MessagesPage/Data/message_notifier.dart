import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/messages.dart';  // Adjust the import path as needed

class MessageNotifier extends StateNotifier<List<Message>> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  MessageNotifier() : super([]) {
    _initializeMessages();
  }

  Future<void> _initializeMessages() async {
    firestore.collection('messages').orderBy('timestamp', descending: true)
        .snapshots().listen((snapshot) {
      state = snapshot.docs
          .map((doc) => Message.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> addMessage(Message message) async {
    await firestore.collection('messages').add(message.toJson());
  }
}

final messageProvider = StateNotifierProvider<MessageNotifier, List<Message>>((ref) => MessageNotifier());
