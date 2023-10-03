import 'package:flutter/material.dart';
import '../Pages/sign_in_view.dart';

void main() {runApp(
  //App widget tree starts from here
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('UHM-SchoolBook'),
      ),
      body: SigninView(), //Scaffold
    ), //MaterialApp
  ),
);}