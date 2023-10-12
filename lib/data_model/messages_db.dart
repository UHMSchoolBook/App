// message_db.dart

class MessageData {
  MessageData({
    required this.username,
    required this.text,
    required this.avatarUrl,
  });

  final String username;
  final String text;
  final String avatarUrl;
}

class MessageDB {
  final List<MessageData> _messages = [
    MessageData(username: 'User 1', text: 'Hello!', avatarUrl: 'https://placekitten.com/50/50'),
    MessageData(username: 'User 2', text: 'Hi there!', avatarUrl: 'https://placekitten.com/49/49'),
    MessageData(username: 'User 3', text: 'How are you?', avatarUrl: 'https://placekitten.com/48/48'),
    MessageData(username: 'User 4', text: 'Good Morning!', avatarUrl: 'https://placekitten.com/47/47'),
    MessageData(username: 'User 5', text: 'Have a nice day!', avatarUrl: 'https://placekitten.com/46/46'),
  ];

  List<MessageData> get messages => _messages;
}