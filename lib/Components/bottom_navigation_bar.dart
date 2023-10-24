import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  CustomBottomNavigationBar({required this.selectedIndex, required this.onTabChanged});
  onTabTapped(int index) {
    onTabChanged(index);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rss_feed),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_tv),
          label: 'Live',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Marketplace',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: onTabTapped,
    );
  }
}

