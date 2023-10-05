import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message('User 1', 'Hello!', 'https://placekitten.com/50/50'),
    Message('User 2', 'Hi there!', 'https://placekitten.com/49/49'),
    Message('User 3', 'How are you?', 'https://placekitten.com/48/48'),
    Message('User 4', 'Good Morning!', 'https://placekitten.com/47/47'),
    Message('User 5', 'Have a nice day!', 'https://placekitten.com/46/46'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(messages[index].avatarUrl),
            ),
            title: Text(messages[index].username),
            subtitle: Text(messages[index].text),
          );
        },
      ),
    );
  }
}

class Message {
  final String username;
  final String text;
  final String avatarUrl;

  Message(this.username, this.text, this.avatarUrl);
}