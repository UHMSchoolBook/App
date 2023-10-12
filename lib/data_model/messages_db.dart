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
    MessageData(username: 'Armin', text: 'Good Morning!', avatarUrl: 'https://hawaiidigitalhealthlab.com/content/images/2023/06/armin.jpeg'),
    MessageData(username: 'John', text: 'Good Work!', avatarUrl: 'https://raw.githubusercontent.com/philipmjohnson/philipmjohnson.github.io/main/img/pmj-headshot.png'),
    MessageData(username: 'Ali', text: 'Hello!', avatarUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTONwt2K3MRTphbihJgxI8ASiZyCRi2fLdXBYW8lyzpzYnTnlaq'),
    MessageData(username: 'Ben', text: 'Hi there!', avatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/74/Benjamin_Netanyahu%2C_February_2023.jpg'),
    MessageData(username: 'Brad', text: 'How are you?', avatarUrl: 'https://m.media-amazon.com/images/M/MV5BMjA1MjE2MTQ2MV5BMl5BanBnXkFtZTcwMjE5MDY0Nw@@._V1_FMjpg_UX1000_.jpg'),
    ];

  List<MessageData> get messages => _messages;
}