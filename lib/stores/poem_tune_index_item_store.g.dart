// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_tune_index_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PoemTuneIndexItemStore on _PoemTuneIndexItemStore, Store {
  final _$isExpandedAtom = Atom(name: '_PoemTuneIndexItemStore.isExpanded');

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  final _$expandAsyncAction = AsyncAction('_PoemTuneIndexItemStore.expand');

  @override
  Future<void> expand(dynamic v) {
    return _$expandAsyncAction.run(() => super.expand(v));
  }

  @override
  String toString() {
    return '''
isExpanded: ${isExpanded}
    ''';
  }
}
