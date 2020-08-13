import 'package:sqflite/sqflite.dart';
import 'package:yin/services/db/poem_tune_entity.dart';
import 'package:yin/services/db/poem_tune_form_entity.dart';

class SqliteRepository {
  final Database _database;

  SqliteRepository(this._database);

  Future<List<PoemTuneEntity>> listAllPoemTunes(int collectionId) async {
    return _database.query(
      "poem_tune",
      where: "collection_id=?",
      whereArgs: [collectionId],
    ).then((rows) => rows.map((row) => PoemTuneEntity.from(row)).toList());
  }

  Future<PoemTuneEntity> getPoemTune(int id) async {
    final result = await _database.query("poem_tune", where: "id=?", whereArgs: [id]);
    return result.isNotEmpty ? PoemTuneEntity.from(result[0]) : null;
  }

  Future<List<PoemTuneFormEntity>> listPoemTuneForms(int poemTuneId) async {
    return _database.query(
      "poem_tune_form",
      where: "poem_tune_id=?",
      whereArgs: [poemTuneId],
    ).then((rows) => rows.map((row) => PoemTuneFormEntity.from(row)).toList());
  }
}
