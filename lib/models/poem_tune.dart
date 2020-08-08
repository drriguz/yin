class PoemTune {
  String name;
  String description;
  List<PoemTuneForm> forms;

  PoemTune({this.name, this.description, this.forms});

  factory PoemTune.from(Map<String, dynamic> json) {
    return PoemTune(
      name: json["name"],
      description: json["description"],
      forms: (json["forms"] as List<dynamic>)
          .map((e) => PoemTuneForm.from(e))
          .toList(),
    );
  }
}

class PoemTuneForm {
  String author;
  String abstract;
  String tips;
  String description;
  PoemTuneTemplate template;

  PoemTuneForm({
    this.author,
    this.abstract,
    this.tips,
    this.description,
    this.template,
  });

  factory PoemTuneForm.from(Map<String, dynamic> json) {
    return PoemTuneForm(
      author: json["author"],
      abstract: json["abstract"],
      tips: json["tips"],
      description: json["description"],
      template: PoemTuneTemplate.from(json["template"]),
    );
  }
}

class PoemTuneTemplate {
  List<TemplateLine> lines;

  PoemTuneTemplate({this.lines});

  factory PoemTuneTemplate.from(Map<String, dynamic> json) {
    return PoemTuneTemplate(
      lines: (json["lines"] as List<dynamic>)
          .map((e) => TemplateLine.from(e))
          .toList(),
    );
  }
}

class TemplateLine {
  String example;
  String pattern;

  TemplateLine({this.example, this.pattern});

  factory TemplateLine.from(Map<String, dynamic> json) {
    return TemplateLine(
      example: json["example"],
      pattern: json["pattern"],
    );
  }
}
