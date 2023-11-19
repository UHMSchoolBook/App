import 'package:connect_people/Features/MessagesPage/Presentation/chats_screen.dart';
import 'package:connect_people/Features/Student_Profile_Page/Presentation/student_ProfilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../firebase_options.dart';
import '../Domain/messages.dart';

Future<void> _backgroundMessageHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   await FirebaseMessaging.instance.getInitialMessage();
//
//   FirebaseMessaging.onBackgroundMessage(
//       _backgroundMessageHandler);
//   runApp(const Messenger());
// }

final navigatorKey = GlobalKey<NavigatorState>();

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  get mainColor => null;

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider(
        create: (_) => FirebaseProvider(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    textStyle:
                    const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(52),
                    backgroundColor: mainColor),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              )),
          home: ChatsScreen(),
        ),
      );
}
