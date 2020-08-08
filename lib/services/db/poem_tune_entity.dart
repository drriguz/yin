/*
CREATE TABLE poem_tune(
    id integer not null primary key autoincrement,
    collection_id integer not null,
    name text not null,
    description text
);
 */
class PoemTuneEntity {
  int id;
  int collectionId;
  String name;
  String description;

  PoemTuneEntity({this.id, this.collectionId, this.name, this.description});

  Map<String, dynamic> toJson() => {
        'id': id,
        'collection_id': collectionId,
        'name': name,
        'description': description,
      };

  factory PoemTuneEntity.from(Map<String, dynamic> json) {
    return PoemTuneEntity(
      id: json['id'],
      collectionId: json['collection_id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
