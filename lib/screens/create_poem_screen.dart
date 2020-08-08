import 'package:flutter/material.dart';
import 'package:yin/services/poem_pattern.dart';
import 'package:yin/widgets/poem_line_input.dart';

class CreatePoemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开始创作"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              "菩萨蛮",
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 40),
              child: TextFormField(
                decoration: InputDecoration(hintText: '输入标题'),
              ),
            ),
            TextFormField(controller: _createController("⊙○⊙●○○▲")),
            TextFormField(controller: _createController("⊙●⊙○△")),
            TextFormField(controller: _createController("⊙○○●△")),
            TextFormField(controller: _createController("⊙○○●▲")),
            TextFormField(controller: _createController("⊙●⊙○▲")),
            TextFormField(controller: _createController("⊙●●○△")),
            TextFormField(controller: _createController("⊙○⊙●△")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '开始创作',
        child: Icon(Icons.add),
      ),
    );
  }

  PoemLineEditController _createController(String codes) {
    return PoemLineEditController(TonePattern.parse(codes));
  }
}
