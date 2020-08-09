import 'package:flutter/material.dart';
import 'package:yin/screens/viewmodels/poem_tune_index.dart';

class PoemTuneIndexItem extends StatelessWidget {
  final PoemTuneIndex data;

  const PoemTuneIndexItem(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data.name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              data.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
