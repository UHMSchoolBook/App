import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  Bottombar({required this.selectedIndex, required this.onTabChanged});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<Bottombar> {
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/StudentProfile');
          break;
        case 2:
          Navigator.pushNamed(context, '/LiveActivity');
          break;
        case 3:
          Navigator.pushNamed(context, '/Messages');
          break;
      // Add more cases for other tabs if needed...
      }
    });
  }

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
      onTap: _onTabChanged, // Use the provided callback function
    );
  }
}
