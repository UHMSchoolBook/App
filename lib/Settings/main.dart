
import 'package:flutter/material.dart';
import '../sign_in/sign_in_view.dart';
import '../Student_Profile_Page/student_ProfilePage.dart';
import '../Feed/feed.dart';
import '../MarketPlacePage/marketplace.dart';
import '../Components/appwrapper.dart';
import '../MessagesPage/messages.dart';
import '../LivePage/livepage.dart';// Import your CustomBottomNavigationBar
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
    '/': (context) => SigninView(),
        '/StudentProfile': (context) => AppWrapper(
          initialIndex: 0,
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/feed': (context) => AppWrapper(
          initialIndex: 1,
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/live': (context) => AppWrapper(
          initialIndex: 2,
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/messages': (context) => AppWrapper(
          initialIndex: 3,
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/marketplace': (context) => AppWrapper(
          initialIndex: 4,
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
      },
      initialRoute: '/',
    );
  }
}


