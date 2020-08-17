import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yin/services/poen_tune_service.dart';
import 'package:yin/stores/poem_tune_detail_store.dart';
import 'package:yin/widgets/loading.dart';

import 'widgets/poem_example.dart';

class PoemTuneDetailScreen extends StatefulWidget {
  final int _id;

  const PoemTuneDetailScreen(this._id, {Key key}) : super(key: key);

  @override
  _PoemTuneDetailScreenState createState() => _PoemTuneDetailScreenState();
}

class _PoemTuneDetailScreenState extends State<PoemTuneDetailScreen> {
  PoemTuneDetailStore _store;

  @override
  void initState() {
    super.initState();
    _store = PoemTuneDetailStore(Provider.of<PoemTuneService>(context, listen: false), widget._id);
    _store.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) => _store.isLoading ? Loading() : PoemExample(_store.detail)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '开始创作',
        child: Icon(Icons.add),
      ),
    );
  }
}
