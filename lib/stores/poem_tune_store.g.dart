// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_tune_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PoemTuneStore on _PoemTuneStore, Store {
  final _$isBusyAtom = Atom(name: '_PoemTuneStore.isBusy');

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_PoemTuneStore.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$_PoemTuneStoreActionController =
      ActionController(name: '_PoemTuneStore');

  @override
  void setBusy() {
    final _$actionInfo = _$_PoemTuneStoreActionController.startAction(
        name: '_PoemTuneStore.setBusy');
    try {
      return super.setBusy();
    } finally {
      _$_PoemTuneStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdle() {
    final _$actionInfo = _$_PoemTuneStoreActionController.startAction(
        name: '_PoemTuneStore.setIdle');
    try {
      return super.setIdle();
    } finally {
      _$_PoemTuneStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy}
    ''';
  }
}
