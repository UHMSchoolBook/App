import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  Bottombar({required this.selectedIndex, required this.onTabChanged});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
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
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: widget.onTabChanged, // Use the provided callback function
    );
  }
}
