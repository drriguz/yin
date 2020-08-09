import 'package:flutter/material.dart';

class PoemTuneIndexItem extends StatelessWidget {
  final String name;

  const PoemTuneIndexItem(this.name, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
