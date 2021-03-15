import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/screens/home_screen.dart';
import 'package:spotify/screens/library_screen.dart';
import 'package:spotify/screens/search_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        SearchScreen(),
        LibraryScreen()
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 22,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedFontSize: 11,
        selectedFontSize: 11,
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: FaIcon(FontAwesomeIcons.home)
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: FaIcon(FontAwesomeIcons.search)
          ),
          BottomNavigationBarItem(
            label: "Your Library",
            icon: FaIcon(FontAwesomeIcons.bookOpen)
          )
        ]
      )
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

}