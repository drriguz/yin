import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yin/screens/viewmodels/poem_tune_index.dart';
import 'package:yin/stores/poem_tune_index_item_store.dart';
import 'package:yin/widgets/tag.dart';

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
    _store = PoemTuneIndexItemStore(
        Provider.of(context, listen: false), widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed("/poem_tune/detail", arguments: widget.data.id),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
              builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildHeader(),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: _createAuthor(),
                          ),
                          _createTags(),
                        ],
                      ),
                      _createExample(_store.example),
                      _store.isExpanded ? _createDescription() : Container(),
                      _store.isExpanded ? _createActions() : Container(),
                    ],
                  )),
        ),
      ),
    );
  }

  Widget _createTags() {
    return Row(
      children: <Widget>[
        Tag("小令", Colors.red),
        Tag("变体5+", Colors.blue),
      ],
    );
  }

  Widget _createAuthor() {
    return Row(
      children: <Widget>[
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://gss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/baike/whfpf%3D806%2C806%2C0/sign=c26609456359252da3424e4452a63b0b/78310a55b319ebc4acda9dc68126cffc1f1716ca.jpg")),
          ),
        ),
        Text("李白"),
      ],
    );
  }

  Widget _createDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        widget.data.description,
        maxLines: _store.isExpanded ? null : 3,
        overflow: _store.isExpanded ? null : TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),
      ),
    );
  }

  Widget _createActions() {
    return Row(
      children: <Widget>[
        IconButton(
          padding: const EdgeInsets.all(1),
          icon: Icon(Icons.favorite_border),
        ),
        IconButton(
          padding: const EdgeInsets.all(1),
          icon: Icon(Icons.location_searching),
        ),
      ],
    );
  }

  Widget _createExample(String example) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        _store.example,
        style:
            Theme.of(context).textTheme.subtitle1.apply(color: Colors.black54),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            widget.data.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        IconButton(
          onPressed: () {
            _store.expand(!_store.isExpanded);
          },
          icon: Observer(
            builder: (_) => _store.isExpanded
                ? Icon(Icons.expand_less)
                : Icon(Icons.expand_more),
          ),
        )
      ],
    );
  }
}
