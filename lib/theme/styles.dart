import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const hanaMin = TextStyle(
  fontFamily: "HanaMinA",
  fontFamilyFallback: ["HanaMinB"],
  fontWeight: FontWeight.bold,
);

const twKai = TextStyle(
  fontFamily: "TW-Kai",
  fontFamilyFallback: ["TW-Kai-Ext-B", "TW-Kai-Plus", "HanaMinB"],
  fontWeight: FontWeight.bold,
);

final platform = defaultTargetPlatform;
final typography = Typography.material2014(platform: platform);

final globalTheme = ThemeData(
  primarySwatch: Colors.indigo,
  textTheme: typography.black.merge(
    TextTheme(
      bodyText1: hanaMin,
      bodyText2: TextStyle(fontFamily: "SourceHanSansCN"),
      headline6: twKai,
    ),
  ),
);
