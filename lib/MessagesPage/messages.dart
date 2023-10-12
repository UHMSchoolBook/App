import 'package:flutter/material.dart';


// Import your data model
import '../data_model/messages_db.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Instantiate your message database
  final MessageDB messageDB = MessageDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: messageDB.messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(messageDB.messages[index].avatarUrl),
            ),
            title: Text(messageDB.messages[index].username),
            subtitle: Text(messageDB.messages[index].text),
          );
        },
      ),
    );
  }
}
