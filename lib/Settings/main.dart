import 'package:connect_people/sign_up/register.dart';
import 'package:flutter/material.dart';
import '../sign_in/sign_in_view.dart';
import '../Student_Profile_Page/student_ProfilePage.dart';
import '../Live_Activity/live_activity_song.dart';
import '../Components/bottom_navigation_bar.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => SigninView(),
      '/SignUp': (context) => SignUpPage(),
      '/StudentProfile': (context) => StudentProfilePage(),
      '/LiveActivity': (context) => LiveActivityPage(),
    },
  ));
}
