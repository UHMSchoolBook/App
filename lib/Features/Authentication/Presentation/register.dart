import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data/authentication_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = "/signup";

  @override
  ConsumerState<SignUpPage> createState() => SignUpViewState();
}

class SignUpViewState extends ConsumerState<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController(); // Controller for full name
  final _imagePathController = TextEditingController(); // Controller for image path
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 40.0),
            Column(
              children: <Widget>[
                Text(
                  "Welcome to",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Image.asset('assets/images/SchoolBook_LOGO.png', width: 350),
                const SizedBox(height: 16.0),
              ],
            ),
            // Email TextField
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            // Password TextField
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            // Name TextField
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),

            // Image Path TextField
            TextField(
              controller: _imagePathController,
              decoration: const InputDecoration(
                labelText: 'Image Path',
              ),
            ),

            // Age TextField
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),

            const SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.read(authenticationServiceProvider).signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                      'name': _nameController.text,
                      'imagePath': _imagePathController.text,
                      'age': _ageController.text,
                    });

                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}