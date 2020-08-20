import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yin/screens/viewmodels/poem_tune_index.dart';
import 'package:yin/stores/poem_tune_index_item_store.dart';

class PoemTuneIndexItem extends StatefulWidget {
  final PoemTuneIndex data;

  const PoemTuneIndexItem(this.data, {Key key}) : super(key: key);

  @override
  _PoemTuneIndexItemState createState() => _PoemTuneIndexItemState();
}

class _PoemTuneIndexItemState extends State<PoemTuneIndexItem> {
  PoemTuneIndexItemStore _store;

  @override
  void initState() {
    super.initState();
    _store = PoemTuneIndexItemStore(Provider.of(context, listen: false), widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/poem_tune/detail", arguments: widget.data.id),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            widget.data.name.substring(0, 1),
            style: const TextStyle(
              fontSize: 48,
              color: Colors.indigo,
              fontFamily: "TW-Kai",
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.data.name.substring(1),
            style: const TextStyle(
              fontSize: 24,
              color: Colors.indigo,
              fontFamily: "TW-Kai",
            ),
          ),
        ),
        Text(
          "小调 32字",
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Observer(
            builder: (_) => Text(
              widget.data.description,
              maxLines: _store.isExpanded ? null : 3,
              overflow: _store.isExpanded ? null : TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.expand_more),
        )
      ],
    );
  }
}
