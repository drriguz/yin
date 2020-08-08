import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yin/services/poem_pattern.dart';

const lineStyle = TextStyle(fontFamily: "SourceHanSans", fontSize: 18, color: Colors.black);
const highlightHintStyle = TextStyle(
  fontFamily: "SourceHanSans",
  fontSize: 18,
  color: Colors.white,
  backgroundColor: Colors.redAccent,
);

final patternStyleMapping = {
  TonePattern.LEVEL: lineStyle.copyWith(color: Colors.red),
  TonePattern.OBLIQUE: lineStyle.copyWith(color: Colors.red),
  TonePattern.LEVEL_UNLIMITED: lineStyle.copyWith(color: Colors.grey),
  TonePattern.OBLIQUE_UNLIMITED: lineStyle.copyWith(color: Colors.grey),
  TonePattern.LEVEL_RHYME: lineStyle.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  ),
  TonePattern.LEVEL_RHYME_FOLLOW: lineStyle.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  ),
  TonePattern.OBLIQUE_RHYME: lineStyle.copyWith(
    color: Colors.red,
    decoration: TextDecoration.underline,
  ),
  TonePattern.OBLIQUE_RHYME_FOLLOW: lineStyle.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.overline,
  ),
};

class PoemLineEditController extends TextEditingController {
  final List<TonePattern> linePattern;

  PoemLineEditController(this.linePattern);

  @override
  TextSpan buildTextSpan({TextStyle style, bool withComposing}) {
    List<InlineSpan> children = [];

    children.add(TextSpan(style: lineStyle, text: text));

    if (text.length < linePattern.length) {
      final remainPatterns = linePattern.sublist(text.length).map((e) => _buildPatternText(e)).toList();
      children.addAll(remainPatterns);
    }

    return TextSpan(style: style, children: children);
  }

  TextSpan _buildPatternText(TonePattern pattern) {
    return TextSpan(style: patternStyleMapping[pattern], text: pattern.name);
  }
}
