import 'package:yin/services/db/repository.dart';

const collectionMapping = {"钦定词谱": 1};

class PoemTuneService {
  final SqliteRepository _repository;

  PoemTuneService(this._repository);

  Future<List<String>> getPoemTuneNames(String collectionName) async {
    final result =  await _repository
        .listAllPoemTunes(_getCollectionId(collectionName))
        .then((items) => items.map((e) => e.name).toList());
    return result;
  }

  int _getCollectionId(String name) {
    return collectionMapping[name];
  }
}
