import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yin/screens/viewmodels/book.dart';
import 'package:yin/screens/widgets/book_item.dart';

class Bookshelf extends StatelessWidget {
  final String name;
  final List<Book> books;

  const Bookshelf(this.name, this.books, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 1,
        child: TabBarView(
          children: <Widget>[Text("hello")],
        ),
      ),
    );
  }
}
