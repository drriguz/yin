import 'package:flutter/material.dart';
import 'package:yin/screens/widgets/draft_item.dart';

class PoemWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的作品"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            DraftItem("相见欢·秋思", "年年岁岁如斯,小儿时,夜影青春,留恋亦难持,莫回首,人应旧,但新词,文采风流,说不尽相思"),
            DraftItem("蝶恋花·小夏", "小夏熏风春去早,回忆无边,酷暑花知道,最肯忘回眸一笑,最不屑那时飘渺.常有浮云遮月貌,欲见还休,饮恨接昏晓,纵使轻狂为君照,天涯梦里曾相告？ "),
            DraftItem("相见欢·残霞", "残霞不语秋风,柳梢重"),
          ],
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
