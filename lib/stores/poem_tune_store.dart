import 'package:mobx/mobx.dart';
import 'package:yin/screens/viewmodels/poem_tune_index.dart';
import 'package:yin/services/poen_tune_service.dart';

part 'poem_tune_store.g.dart';

class PoemTuneStore = _PoemTuneStore with _$PoemTuneStore;

abstract class _PoemTuneStore with Store {
  final PoemTuneService _poemTuneService;
  final String _collectionName;

  @observable
  bool isBusy = false;

  List<PoemTuneIndex> poemTuneIndex = List<PoemTuneIndex>();

  _PoemTuneStore(this._poemTuneService, this._collectionName);

  @action
  void setBusy() => isBusy = true;

  @action
  void setIdle() => isBusy = false;

  @action
  Future<void> load() async {
    setBusy();
    poemTuneIndex.clear();
    poemTuneIndex.addAll(await _poemTuneService.getPoemTuneIndex(_collectionName));
    setIdle();
  }
}
