import 'package:flutter/material.dart';
import 'package:yin/screens/poem_tune_tab_screen.dart';

import 'poem_works_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final List<Widget> _tabItems = <Widget>[
    PoemWorksScreen(),
    PoemTuneTabScreen(),
    PoemWorksScreen(),
    PoemWorksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabItems.elementAt(_currentPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.music_note), title: Text("创作")),
          BottomNavigationBarItem(icon: Icon(Icons.format_align_left), title: Text("词谱")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("词库")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置")),
        ],
        type: BottomNavigationBarType.fixed,
        // without this line tab icon won't display
        currentIndex: _currentPageIndex,
        onTap: _onTabActivate,
      ),
    );
  }

  void _onTabActivate(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}
