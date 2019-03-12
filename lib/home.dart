import 'package:flutter/material.dart';
import 'pages/score.dart';
import 'pages/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final List<Widget> _childPage = [
    ScorePage(),
    SearchPage(),
    Container(color: Colors.blue)
  ];

  final List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("search")),
    BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("Score")),
    BottomNavigationBarItem(icon: Icon(Icons.score) , title: Text("dice")),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: _navBarItems,
        onTap: onTabTapped,
      ),
      body: _childPage[_currentPageIndex],
    );
  }
}
