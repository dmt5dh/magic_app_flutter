import 'package:flutter/material.dart';
import 'pages/score.dart';
import 'package:magic_app_flutter/pages/search/search.dart';
import 'package:magic_app_flutter/pages/dice.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final List<Widget> _childPage = [
    ScorePage(),
    SearchPage(),
    DicePage()
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
