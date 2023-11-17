import 'package:connect_people/Features/Authentication/Presentation/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Features/Authentication/Data/authentication_notifier.dart';
import 'Features/Authentication/Presentation/sign_in_view.dart';
import 'Features/MessagesPage/Presentation/chat_screen.dart';
import 'Features/Student_Profile_Page/Data/user_notifier.dart';
import 'Features/Student_Profile_Page/Domain/user_db.dart';
import 'Features/Student_Profile_Page/Presentation/student_ProfilePage.dart';
import 'Features/Feed/Presentation/feed.dart';
import 'Features/MarketPlacePage/Presentation/marketplace.dart';
import 'Features/Common/appwrapper.dart';
import 'Features/MessagesPage/Presentation/chats_screen.dart';
import 'Features/LivePage/Presentation/livepage.dart';
import 'Features/Settings/Presentation/settings_page.dart';

class MyApp extends ConsumerWidget {

  final selectedIndexProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final authState = ref.watch(authStateChangesProvider);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      routes: {
        //'/': (context) => SigninView(),
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
      //initialRoute: '/',
      home: authState.when(
        data: (user) {
          if (user != null && user.email != null) {
            print("User Email: ${user.email}");
            final userID = userDB.getUserIDByEmail(user.email!); // Use the non-null assertion operator (!) after checking for null
            ref.read(currentUserIDProvider.notifier).state = userID;
            return AppWrapper(pages: [
              StudentProfilePage(),
              FeedPage(),
              LiveActivityPage(),
              ChatScreen(),
              MarketplacePage(),
            ],);
          } else {
            return SigninView();
          }
        },
        loading: () => CircularProgressIndicator(),
        error: (_, __) => Scaffold(
          body: Center(
            child: Text('Something went wrong!'),
          ),
        ),
      ),


    );
  }
}
