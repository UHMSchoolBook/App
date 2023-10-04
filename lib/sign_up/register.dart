import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({Key? key}) : super(key: key);

  static const routeName = "/signup";

  @override
  State<SignUpPage> createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _first_name = TextEditingController();
  final _last_name = TextEditingController();
  final _age = TextEditingController();

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
            TextField(
              controller: _first_name,
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: _last_name,
              decoration: const InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              controller: _age,
              decoration: const InputDecoration(
                labelText: 'age',
              ),
            ),
            // [Name]
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 100,),
            ElevatedButton(
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushReplacementNamed(context, '/StudentProfile');
                },
                child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}