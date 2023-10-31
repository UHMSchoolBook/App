import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/messages_db.dart';

class MessageNotifier extends StateNotifier<List<MessageData>> {
  MessageNotifier() : super([]);
  void addMessage(MessageData message){
    state = [...state, message];
  }
}

final messageProvider = StateNotifierProvider<MessageNotifier, List<MessageData>> ((ref) => MessageNotifier());