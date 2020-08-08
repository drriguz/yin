/*
CREATE TABLE poem_tune_form(
    id integer not null primary key autoincrement,
    poem_tune_id integer not null,
    author text,
    style text,
    template text not null,
    tips text,
    description text
);
 */
class PoemTuneFormEntity {
  int id;
  int poemTuneId;
  String author;
  String style;
  String template;
  String tips;
  String description;

  PoemTuneFormEntity({
    this.id,
    this.poemTuneId,
    this.author,
    this.style,
    this.template,
    this.tips,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'poem_tune_id': poemTuneId,
        'author': author,
        'style': style,
        'template': template,
        'tips': tips,
        'description': description,
      };

  factory PoemTuneFormEntity.from(Map<String, dynamic> json) {
    return PoemTuneFormEntity(
      id: json['id'],
      poemTuneId: json['poem_tune_id'],
      author: json['author'],
      style: json['style'],
      template: json['template'],
      tips: json['tips'],
      description: json['description'],
    );
  }
}
