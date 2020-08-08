import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yin/screens/viewmodels/book.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem(this.book, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(),
            image: DecorationImage(
              image: AssetImage("assets/images/${book.cover}"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
