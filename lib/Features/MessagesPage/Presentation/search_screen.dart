import 'package:connect_people/Features/MessagesPage/Presentation/user_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Student_Profile_Page/Domain/user_db.dart';
import '../Domain/message.dart';
import 'custom_text_field.dart';
import 'empty_widget.dart';

class UsersSearchScreen extends StatefulWidget {
  const UsersSearchScreen({Key? key}) : super(key: key);

  @override
  State<UsersSearchScreen> createState() =>
      _UsersSearchScreenState();
}

class _UsersSearchScreenState
    extends State<UsersSearchScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.black,
      title: const Text(
        'Users Search',
        style: TextStyle(fontSize: 25),
      ),
    ),
    body: Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomTextFormField(
            controller: controller,
            hintText: 'Search',
            onChanged: (val) =>
                Provider.of<FirebaseProvider>(context,
                    listen: false)
                    .searchUser(val),
          ),
          Consumer<FirebaseProvider>(
            builder: (context, value, child) =>
                Expanded(
                  child: controller.text.isEmpty
                      ? const EmptyWidget(
                      icon: Icons.search,
                      text: 'Search of User')
                      : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: value.search.length,
                    itemBuilder: (context, index) =>
                    value.search[index].email !=
                        FirebaseAuth.instance
                            .currentUser?.email
                        ? UserItem(
                        user: value
                            .search[index])
                        : const SizedBox(),
                  ),
                ),
          ),
        ],
      ),
    ),
  );
}