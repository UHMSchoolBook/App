import 'package:flutter/material.dart';
import '../../Student_Profile_Page/Presentation/student_ProfilePage.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Data/authentication_notifier.dart';
/// Presents the page containing fields to enter a username and password, plus buttons.
class SigninView extends ConsumerWidget {
  const SigninView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

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
            const SizedBox(height: 120.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Sign in logic
                  await ref.read(authenticationServiceProvider).signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                } catch (e) {
                  // Handle errors
                  print(e); // Log the error for debugging
                  // Show an error message to the user
                }

              },
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 12.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account? "),
              TextButton(
                child: const Text('Sign up'),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              )
            ]),
          ],
        ),
      ),
    );
  }
}

