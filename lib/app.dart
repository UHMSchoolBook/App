import 'package:connect_people/Features/Authentication/Presentation/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Features/Authentication/Presentation/sign_in_view.dart';
import 'Features/Student_Profile_Page/Presentation/student_ProfilePage.dart';
import 'Features/Feed/Presentation/feed.dart';
import 'Features/MarketPlacePage/Presentation/marketplace.dart';
import 'Features/Common/appwrapper.dart';
import 'Features/MessagesPage/Presentation/messages.dart';
import 'Features/LivePage/Presentation/livepage.dart';
import 'Features/Settings/Presentation/settings_page.dart';

class MyApp extends ConsumerWidget {

  final selectedIndexProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routes: {
        '/': (context) => SigninView(),
        '/register': (context) => SignUpPage(),
        '/settings': (context) => SettingsPage(),
        '/StudentProfile': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/feed': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/live': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/messages': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            LiveActivityPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/marketplace': (context) => AppWrapper(
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
