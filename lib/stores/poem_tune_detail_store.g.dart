// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_tune_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PoemTuneDetailStore on _PoemTuneDetailStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_PoemTuneDetailStore.isLoading'))
          .value;

  final _$detailAtom = Atom(name: '_PoemTuneDetailStore.detail');

  @override
  PoemTuneDetail get detail {
    _$detailAtom.reportRead();
    return super.detail;
  }

  @override
  set detail(PoemTuneDetail value) {
    _$detailAtom.reportWrite(value, super.detail, () {
      super.detail = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_PoemTuneDetailStore.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
detail: ${detail},
isLoading: ${isLoading}
    ''';
  }
}
