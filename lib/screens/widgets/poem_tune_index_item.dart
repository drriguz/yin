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
        child: Row(
          children: <Widget>[
            _buildHeader(),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 70,
      child: Column(
        children: <Widget>[
          Text(
            data.name.substring(0, 1),
            style: const TextStyle(
              fontSize: 48,
              color: Colors.indigo,
              fontFamily: "Liu",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.name,
          ),
          Text(
            data.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
