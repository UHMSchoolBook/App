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
    MessageData(username: 'Ali', text: 'Hello!', avatarUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTONwt2K3MRTphbihJgxI8ASiZyCRi2fLdXBYW8lyzpzYnTnlaq'),
    MessageData(username: 'Ben', text: 'Hi there!', avatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/74/Benjamin_Netanyahu%2C_February_2023.jpg'),
    MessageData(username: 'Brad', text: 'How are you?', avatarUrl: 'https://m.media-amazon.com/images/M/MV5BMjA1MjE2MTQ2MV5BMl5BanBnXkFtZTcwMjE5MDY0Nw@@._V1_FMjpg_UX1000_.jpg'),
    MessageData(username: 'Shakira', text: 'Good Morning!', avatarUrl: 'https://hips.hearstapps.com/hmg-prod/images/shakira-2023-fashion-see-through-outfit-tiktok-641b0d2f0429c.jpeg?crop=0.324xw:0.248xh;0.434xw,0.0481xh&resize=1200:*'),
    MessageData(username: 'Lana Del Rey', text: 'Have a nice day!', avatarUrl: 'https://pyxis.nymag.com/v1/imgs/4b9/fb9/74f8a3ed7f600b2081740ae60637ead7ee-lana-del-rey.rvertical.w330.jpg'),
  ];

  List<MessageData> get messages => _messages;
}