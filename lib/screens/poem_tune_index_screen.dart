import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yin/services/poen_tune_service.dart';
import 'package:yin/stores/poem_tune_store.dart';

import 'widgets/poem_tune_index_item.dart';

class PoemTuneIndexScreen extends StatefulWidget {
  final String name;
  final String description;

  const PoemTuneIndexScreen(this.name, this.description, {Key key}) : super(key: key);

  @override
  _PoemTuneIndexScreenState createState() => _PoemTuneIndexScreenState();
}

class _PoemTuneIndexScreenState extends State<PoemTuneIndexScreen> with AutomaticKeepAliveClientMixin {
  PoemTuneStore _store;

  @override
  void initState() {
    super.initState();
    print("${widget.name} init...");
    _store = PoemTuneStore(Provider.of<PoemTuneService>(context, listen: false), widget.name);
    _store.load();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _store.isBusy ? _loading() : _renderIndex(),
    );
  }

  Widget _renderIndex() {
    return ListView.builder(
      itemCount: _store.poemTuneIndex.length,
      itemBuilder: (_, index) {
        final item = _store.poemTuneIndex[index];
        return PoemTuneIndexItem(item);
      },
    );
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
