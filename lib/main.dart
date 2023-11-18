import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Features/MessagesPage/Domain/message.dart';
import 'app.dart';
import 'firebase_options.dart'; // Your Firebase configuration file

final firebaseProvider = ChangeNotifierProvider((ref) => FirebaseProvider());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}





