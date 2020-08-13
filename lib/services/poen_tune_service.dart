import 'package:yin/screens/viewmodels/poem_tune_detail.dart';
import 'package:yin/screens/viewmodels/poem_tune_index.dart';
import 'package:yin/services/db/poem_tune_entity.dart';
import 'package:yin/services/db/repository.dart';

const collectionMapping = {
  "白香词谱": 0,
  "钦定词谱": 1,
};

class PoemTuneService {
  final SqliteRepository _repository;
  final Map<String, List<PoemTuneEntity>> cache = new Map<String, List<PoemTuneEntity>>();

  PoemTuneService(this._repository);

  Future<List<PoemTuneIndex>> getPoemTuneIndex(String collectionName) async {
    return _fetchCollection(collectionName)
        .then((items) => items.map((e) => PoemTuneIndex(e.id, e.name, e.description)).toList());
  }

  Future<List<PoemTuneEntity>> _fetchCollection(String collectionName) async {
    if (!cache.containsKey(collectionName)) {
      cache[collectionName] = await _repository.listAllPoemTunes(_getCollectionId(collectionName));
    }
    return cache[collectionName];
  }

  Future<PoemTuneDetail> fetchPoemTuneDetail(int id) async {
    final index = await _repository.getPoemTune(id);
    if (index == null) return null;
    final forms = await _repository.listPoemTuneForms(id);
    return PoemTuneDetail(index, forms);
  }

  int _getCollectionId(String name) {
    return collectionMapping[name];
  }
}
