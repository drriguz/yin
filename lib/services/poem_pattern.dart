class TonePattern {
  // ○平聲、●仄聲、◎本仄可平、⊙本平可仄、□平韻、■仄韻、◇協平韻、◆協仄韻
  final String pattern;
  final String name;

  const TonePattern._internal(this.pattern, this.name);

  static const LEVEL = TonePattern._internal("○", "平");
  static const OBLIQUE = TonePattern._internal("●", "仄");
  static const LEVEL_UNLIMITED = TonePattern._internal("⊙", "平");
  static const OBLIQUE_UNLIMITED = TonePattern._internal("◎", "仄");
  static const LEVEL_RHYME = TonePattern._internal("□", "平");
  static const LEVEL_RHYME_FOLLOW = TonePattern._internal("◇", "平");
  static const OBLIQUE_RHYME = TonePattern._internal("■", "仄");
  static const OBLIQUE_RHYME_FOLLOW = TonePattern._internal("◆", "仄");

  static const _patternMapping = {
    "○": LEVEL,
    "●": OBLIQUE,
    "⊙": LEVEL_UNLIMITED,
    "◎": OBLIQUE_UNLIMITED,
    "□": LEVEL_RHYME,
    "◇": LEVEL_RHYME_FOLLOW,
    "■": OBLIQUE_RHYME,
    "◆": OBLIQUE_RHYME_FOLLOW,

    //
    "△": LEVEL_RHYME,
    "▲": OBLIQUE_RHYME,
  };

  factory TonePattern.from(String code) {
    if (_patternMapping.containsKey(code)) return _patternMapping[code];
    throw new ArgumentError("Illegal pattern");
  }

  static List<TonePattern> parse(String codes) {
    final patterns = new List<TonePattern>();
    for (int i = 0; i < codes.length; i++) {
      final String code = codes[i];
      patterns.add(TonePattern.from(code));
    }
    return patterns;
  }

  @override
  String toString() => pattern;
}
