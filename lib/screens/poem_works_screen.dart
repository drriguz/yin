import 'package:flutter/material.dart';

class PoemWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的作品"),
      ),
      body: Container(
        child: Text(
          """
            CJK基本  义礼说选
            CJK扩展A 㡛㬐㖧䵍
            CJK扩展B 𣚣䶅𪘆𦞕
            CJK扩展C 𪢨𪪖𫔺𫜴
            CJK扩展D 𫝀𫞂𫝻𫠝
            CJK扩展E 𫠫𬚚𬳕𬺡
            CJK扩展F 𬺰𬺱𮯟𮯠""",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/song_poem/create"),
        tooltip: '开始创作',
        child: Icon(Icons.add),
      ),
    );
  }
}
