import 'package:connect_people/Authentication/Presentation/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Authentication/Presentation/sign_in_view.dart';
import '../Student_Profile_Page/Presentation/student_ProfilePage.dart';
import '../Feed/Presentation/feed.dart';
import '../MarketPlacePage/Presentation/marketplace.dart';
import '../Components/appwrapper.dart';
import '../MessagesPage/Presentation/messages.dart';
import '../LivePage/Presentation/livepage.dart';
import '../Settings/settings_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}



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


