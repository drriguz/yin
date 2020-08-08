import 'package:flutter/material.dart';

class PoemWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的作品"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/song_poem/create"),
        tooltip: '开始创作',
        child: Icon(Icons.add),
      ),
    );
  }
}
