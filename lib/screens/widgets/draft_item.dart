import 'package:flutter/material.dart';

class DraftItem extends StatelessWidget {
  final String title;
  final String description;

  const DraftItem(this.title, this.description, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
