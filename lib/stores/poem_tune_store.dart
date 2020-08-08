import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:yin/models/poem_tune.dart';
import 'package:yin/services/poen_tune_service.dart';

part 'poem_tune_store.g.dart';

class PoemTuneStore = _PoemTuneStore with _$PoemTuneStore;

abstract class _PoemTuneStore with Store {
  final PoemTuneService _poemTuneService;
  final String _collectionName;

  @observable
  bool isBusy = false;

  List<String> poemTuneNames = List<String>();

  _PoemTuneStore(this._poemTuneService, this._collectionName);

  @action
  void setBusy() => isBusy = true;

  @action
  void setIdle() => isBusy = false;

  @action
  Future<void> load() async {
    setBusy();
    poemTuneNames.clear();
    poemTuneNames.addAll(await _poemTuneService.getPoemTuneNames(_collectionName));
    setIdle();
  }
}
