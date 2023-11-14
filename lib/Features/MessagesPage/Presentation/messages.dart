import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/message.dart';
// import '../Domain/messages_db.dart';
import '../Data/message_notifier.dart';

class ChatScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddMessageDialog(context, ref),
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

  _showAddMessageDialog(BuildContext context, WidgetRef ref) {
    String? username, text, avatarUrl;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add New Message'),
            content: Column(
              children: [
                TextField(
                  onChanged: (val) => username = val,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  onChanged: (val) => text = val,
                  decoration: InputDecoration(labelText: 'Message Text'),
                ),
                TextField(
                  onChanged: (val) => avatarUrl = val,
                  decoration: InputDecoration(labelText: 'Avatar URL'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (username != null && text != null && avatarUrl != null) {
                    ref.read(messageProvider.notifier).addMessage(
                        MessageData(username: username!, text: text!, avatarUrl: avatarUrl!));
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }
}
