import 'package:connect_people/Features/MessagesPage/Presentation/search_screen.dart';
import 'package:connect_people/Features/MessagesPage/Presentation/user_item.dart';
import 'package:connect_people/Features/Student_Profile_Page/Domain/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Domain/messages.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with WidgetsBindingObserver {
  final notificationService = NotificationsService();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(Duration.zero, () {
      Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    });
    notificationService.firebaseNotification(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        FirebaseFirestoreService.updateUserData({
          'lastActive': DateTime.now(),
          'isOnline': true,
        });
        break;

      case AppLifecycleState.inactive:

      case AppLifecycleState.paused:

      case AppLifecycleState.detached:
        FirebaseFirestoreService.updateUserData(
            {'isOnline': false});
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Chats'),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) =>
                  const UsersSearchScreen())),
          icon: const Icon(Icons.search,
              color: Colors.black),
        ),
        IconButton(
          onPressed: () =>
              FirebaseAuth.instance.signOut(),
          icon: const Icon(Icons.logout,
              color: Colors.black),
        ),
      ],
    ),
    body: Consumer<FirebaseProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            padding:
            const EdgeInsets.symmetric(horizontal: 16),
            itemCount: value.users.length,
            separatorBuilder: (context, index) =>
            const SizedBox(height: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => value
                .users[index].email !=
                FirebaseAuth.instance.currentUser?.email
                ? UserItem(user: value.users[index])
                : const SizedBox(),
          );
        }),
  );
}