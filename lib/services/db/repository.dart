import 'package:sqflite/sqflite.dart';
import 'package:yin/services/db/poem_tune_entity.dart';

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
}
