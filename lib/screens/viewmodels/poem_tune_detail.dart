import 'dart:convert';

import 'package:yin/services/db/poem_tune_entity.dart';
import 'package:yin/services/db/poem_tune_form_entity.dart';

class TemplateLine {
  String example;
  String pattern;

  TemplateLine({this.example, this.pattern});

  factory TemplateLine.from(Map<String, dynamic> json) {
    return TemplateLine(
      example: json['example'],
      pattern: json['pattern'],
    );
  }
}

class PoemTuneSection {
  List<TemplateLine> lines;

  PoemTuneSection(this.lines);

  factory PoemTuneSection.from(List<dynamic> json) {
    return PoemTuneSection(json.map((e) => TemplateLine.from(e)).toList());
  }
}

class PoemTuneTemplate {
  List<PoemTuneSection> sections;

  PoemTuneTemplate(this.sections);

  factory PoemTuneTemplate.from(Map<String, dynamic> json) {

    print(json["sections"]);
    final List<dynamic> sectionsJson = json["sections"];
    final sections = sectionsJson.map((e) => PoemTuneSection.from(e)).toList();
    return PoemTuneTemplate(sections);
  }
}

class PoemTuneForm extends PoemTuneFormEntity {
  PoemTuneTemplate templateObject;

  PoemTuneForm(PoemTuneFormEntity entity) {
    id = entity.id;
    poemTuneId = entity.poemTuneId;
    author = entity.author;
    style = entity.style;
    template = entity.template;
    tips = entity.tips;
    description = entity.description;
    templateObject = PoemTuneTemplate.from(json.decode(template));
  }
}

class PoemTuneDetail {
  final PoemTuneEntity index;
  final List<PoemTuneForm> forms;

  String get name => index?.name;

  String get description => index?.description;

  PoemTuneDetail(this.index, List<PoemTuneFormEntity> formEntities)
      : forms = formEntities.map((e) => PoemTuneForm(e)).toList();
}
