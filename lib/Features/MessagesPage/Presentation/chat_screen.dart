import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Student_Profile_Page/Domain/users.dart';
import '../Domain/messages.dart';
import 'chat_messages.dart';
import 'chat_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});

  final String? userId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    print("ChatScreen initialized with userId: ${widget.userId}");
    Provider.of<FirebaseProvider>(context, listen: false)
      ..getUserById(widget.userId)
      ..getMessages(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ChatMessages(receiverId: widget.userId),
            ChatTextField(receiverId: widget.userId)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    final firebaseProvider = Provider.of<FirebaseProvider>(context, listen: false);

    return AppBar(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      title: FutureBuilder<UserData?>(
        future: firebaseProvider.getUserById(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError || snapshot.data == null) {
            // print(widget.userId);
            return Text("User not found");
          }
          UserData? userdata = snapshot.data;
          print("*********************");
          print(userdata?.email);
          print("**********************");
          return userdata != null ? Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(userdata.imagePath),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userdata.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   userdata.isOnline ? 'Online' : 'Offline',
                  //   style: TextStyle(
                  //     color: userdata.isOnline ? Colors.green : Colors.grey,
                  //     fontSize: 14,
                  //   ),
                  // ),
                ],
              ),
            ],
          ) : const SizedBox();  // Show empty widget if userdata is null
        },
      ),
    );
  }

}