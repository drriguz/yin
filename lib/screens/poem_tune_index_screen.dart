import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:yin/models/poem_tune.dart';
import 'package:yin/services/poen_tune_service.dart';
import 'package:yin/stores/poem_tune_store.dart';

class PoemTuneIndexScreen extends StatefulWidget {
  final String name;
  final String description;

  const PoemTuneIndexScreen(this.name, this.description, {Key key})
      : super(key: key);

  @override
  _PoemTuneIndexScreenState createState() => _PoemTuneIndexScreenState();
}

class _PoemTuneIndexScreenState extends State<PoemTuneIndexScreen>
    with AutomaticKeepAliveClientMixin {
  PoemTuneStore _store;

  @override
  void initState() {
    super.initState();
    print("${widget.name} init...");
    _store = PoemTuneStore(
        Provider.of<PoemTuneService>(context, listen: false), widget.name);
    _store.load();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _store.isBusy ? _loading() : _renderIndex(),
    );
    return Text("hello");
  }

  Widget _renderIndex() {
    return ListView.builder(
      itemCount: _store.poemTuneNames.length,
      itemBuilder: (_, index) {
        print("render...$index");
        final String poemTuneName = _store.poemTuneNames[index];
        return Text(poemTuneName);
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
