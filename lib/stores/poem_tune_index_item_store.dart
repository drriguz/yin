
import 'package:mobx/mobx.dart';
import 'package:yin/screens/viewmodels/poem_tune_index.dart';
import 'package:yin/services/poen_tune_service.dart';

part 'poem_tune_index_item_store.g.dart';

class PoemTuneIndexItemStore = _PoemTuneIndexItemStore with _$PoemTuneIndexItemStore;

abstract class _PoemTuneIndexItemStore with Store {
  final PoemTuneService _poemTuneService;
  final PoemTuneIndex _item;

  @observable
  bool isExpanded = false;

  List<PoemTuneIndex> poemTuneIndex = List<PoemTuneIndex>();

  _PoemTuneIndexItemStore(this._poemTuneService, this._item);

  @action
  Future<void> expand(v) async {
    isExpanded = v;
  }
}
