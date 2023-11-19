import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Domain/messages.dart';
import 'empty_widget.dart';
import 'message_bubble.dart';

class ChatMessages extends StatelessWidget {
  ChatMessages({super.key, required this.receiverId});
  final String? receiverId;

  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseProvider>(
      builder: (context, value, child) => value.messages.isEmpty
          ? const Expanded(
        child: EmptyWidget(icon: Icons.waving_hand, text: 'Say Hello!'),
      )
          : Expanded(
        child: ListView.builder(
          controller: Provider.of<FirebaseProvider>(context, listen: false).scrollController,
          itemCount: value.messages.length,
          itemBuilder: (context, index) {
            final isTextMessage = value.messages[index].messageType == "text"; // Updated to check string value
            final isMe = receiverId != value.messages[index].senderId;

            return MessageBubble(
              isMe: isMe,
              message: value.messages[index],
              isImage: !isTextMessage, // If it's not text, it's an image
            );
          },
        ),
      ),
    );
  }
}