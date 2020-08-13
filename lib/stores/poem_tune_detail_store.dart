import 'package:mobx/mobx.dart';
import 'package:yin/screens/viewmodels/poem_tune_detail.dart';
import 'package:yin/services/poen_tune_service.dart';

part 'poem_tune_detail_store.g.dart';

class PoemTuneDetailStore = _PoemTuneDetailStore with _$PoemTuneDetailStore;

abstract class _PoemTuneDetailStore with Store {
  final PoemTuneService _poemTuneService;
  final int _id;

  @observable
  PoemTuneDetail detail;

  @computed
  bool get isLoading => detail == null;

  _PoemTuneDetailStore(this._poemTuneService, this._id);

  @action
  Future<void> fetch() async {
    detail = await _poemTuneService.fetchPoemTuneDetail(_id);
  }
}
