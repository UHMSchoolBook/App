import 'package:connect_people/Features/Authentication/Presentation/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Features/Authentication/Data/authentication_notifier.dart';
import 'Features/Authentication/Presentation/sign_in_view.dart';
import 'Features/EventsPage/Presentation/eventspage.dart';
import 'Features/Student_Profile_Page/Data/user_notifier.dart';
import 'Features/Student_Profile_Page/Domain/users_collection.dart';
import 'Features/Student_Profile_Page/Presentation/student_ProfilePage.dart';
import 'Features/Feed/Presentation/feed.dart';
import 'Features/MarketPlacePage/Presentation/marketplace.dart';
import 'Features/Common/appwrapper.dart';
import 'Features/MessagesPage/Presentation/messages.dart';
import 'Features/Settings/Presentation/settings_page.dart';

class MyApp extends ConsumerWidget {
  final selectedIndexProvider = StateProvider<int>((ref) => 0);
  final UserDB userDB = UserDB();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final authState = ref.watch(authStateChangesProvider);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: authState.when(
        data: (user) {
          if (user != null && user.email != null) {
            return FutureBuilder<String?>(
              future: userDB.getUserIDByEmail(user.email!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(child: Text('${snapshot.error}')),
                    );
                  }

                  if (snapshot.hasData) {

                    final userID = snapshot.data!;
                    print("User ID: $userID");
                    // Defer the state update to after the build process
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(currentUserIDProvider.notifier).state = userID;
                    });
                    return AppWrapper(pages: [
                      StudentProfilePage(),
                      FeedPage(),
                      EventsPage(), // Replaced LiveActivityPage with EventsPage
                      ChatScreen(),
                      MarketplacePage(),
                    ]);
                  }
                }
                // Show loading indicator while waiting for the future to complete
                return CircularProgressIndicator();
              },
            );
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
      routes: {
        '/register': (context) => SignUpPage(),
        '/settings': (context) => SettingsPage(),
        '/StudentProfile': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            EventsPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/feed': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            EventsPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/live': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            EventsPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/messages': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            EventsPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
        '/marketplace': (context) => AppWrapper(
          pages: [
            StudentProfilePage(),
            FeedPage(),
            EventsPage(),
            ChatScreen(),
            MarketplacePage(),
          ],
        ),
      },
    );
  }
}