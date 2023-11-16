import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Authentication/Data/authentication_notifier.dart';
import 'bottom_navigation_bar.dart';
import '../Settings/Presentation/settings_page.dart';
class AppWrapper extends ConsumerWidget {
  final List<Widget> pages;
  final List<String> sectionTitles = [
    'Profile',
    'Feed',
    'Live',
    'Messages',
    'Marketplace',
  ];
  final selectedIndexProvider = StateProvider<int>((ref) => 0);
  AppWrapper({required this.pages});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = ref.watch(selectedIndexProvider);
    final authService = ref.read(authenticationServiceProvider); // Assuming you have a provider for AuthenticationService

    return Scaffold(
      appBar: AppBar(
        title: Text(sectionTitles[_selectedIndex]),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Settings'),
              onTap: () {
                  Navigator.of(context).pushNamed('/settings');
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () async {
                await authService.signOut(); // Call signOut from AuthenticationService

                // Close the drawer
                Navigator.of(context).pop();

                // Navigate to the SigninView
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChanged: (index) {
          ref.read(selectedIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}



