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

  int _getCollectionId(String name) {
    return collectionMapping[name];
  }
}
