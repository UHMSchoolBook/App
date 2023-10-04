import 'package:flutter/material.dart';
import '../sign_in/sign_in_view.dart';
import '../Student_Profile_Page/student_ProfilePage.dart';

void main() {runApp(
  //App widget tree starts from here
  MaterialApp(
    routes: {
      '/': (context) => SigninView(),
      '/StudentProfile': (context) => StudentProfilePage(),
    },//MaterialApp
  ),
);}