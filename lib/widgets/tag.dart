import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String name;
  final Color color;

  const Tag(this.name, this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.all(const Radius.elliptical(5, 5))),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Text(
          name,
          style: TextStyle(fontSize: 12, color: color),
        ),
      ),
    );
  }
}
