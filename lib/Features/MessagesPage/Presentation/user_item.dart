import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../Student_Profile_Page/Domain/user_db.dart';
import 'chat_screen.dart';
import 'constant.dart';

class UserItem extends StatefulWidget {
  const UserItem({super.key, required this.user});

  final UserData user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) =>
                ChatScreen(userId: widget.user.id))),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
            NetworkImage(widget.user.imagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CircleAvatar(
              backgroundColor: widget.user.isOnline
                  ? Colors.green
                  : Colors.grey,
              radius: 5,
            ),
          ),
        ],
      ),
      title: Text(
        widget.user.name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Last Active : ${timeago.format(widget.user.lastActive)}',
        maxLines: 2,
        style: const TextStyle(
          color: mainColor,
          fontSize: 15,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
  );
}