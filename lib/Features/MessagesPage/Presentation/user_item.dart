import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Student_Profile_Page/Data/user_notifier.dart';
import '../../Student_Profile_Page/Domain/users.dart';
import 'chat_screen.dart';
import '../../Student_Profile_Page/Domain/users_collection.dart';

class UserItem extends StatefulWidget {
  const UserItem({Key? key, required this.user}) : super(key: key);

  final UserData user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  final UserDB userDB = UserDB();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Fetch the userId asynchronously
        final userId = await userDB.getUserIDByEmail(widget.user.email);
        if (userId != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatScreen(userId: userId),
            ),
          );
        } else {
          // Handle the case where userId is null
        }
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(widget.user.imagePath),
        ),
        title: Text(
          widget.user.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
