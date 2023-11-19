import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Features/MessagesPage/Domain/messages.dart';
import 'app.dart';
import 'firebase_options.dart'; // Your Firebase configuration file

final firebaseProvider = ChangeNotifierProvider((ref) => FirebaseProvider());
Future<void> _backgroundMessageHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();

  FirebaseMessaging.onBackgroundMessage(
      _backgroundMessageHandler);

  runApp(ProviderScope(child: MyApp()));
}





