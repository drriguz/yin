import 'package:flutter/material.dart';

import 'poem_tune_index_screen.dart';

class PoemTuneTabScreen extends StatefulWidget {
  @override
  _PoemTuneTabScreenState createState() => _PoemTuneTabScreenState();
}

class _PoemTuneTabScreenState extends State<PoemTuneTabScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _searchInputController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _searchInputController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("词谱"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "钦定词谱"),
            Tab(text: "白香词谱"),
            Tab(text: "韵表"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PoemTuneIndexScreen("钦定词谱", ""),
          PoemTuneIndexScreen("白香词谱", ""),
          Text("3"),
        ],
      ),
    );
  }
}
