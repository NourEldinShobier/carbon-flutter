import 'package:carbon/carbon.dart';

import 'package:flutter/material.dart';

class CThemes {
  static ThemeData getTheme(CTheme theme) {
    if (theme == CTheme.gray100) return _gray100;

    return _gray100;
  }

  static final _gray100 = ThemeData(
    primaryColor: CColors.blue60,
    accentColor: CColors.gray70,
    canvasColor: CColors.gray100,
    scaffoldBackgroundColor: CColors.gray100,
    highlightColor: CColors.blue70,
    backgroundColor: CColors.gray100,
    indicatorColor: CColors.blue70,
    hintColor: CColors.gray10,
    errorColor: CColors.red40,
    fontFamily: 'packages/carbon/${CFonts.primaryRegular}',
    iconTheme: IconThemeData(color: CColors.gray10),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CColors.gray10,
      selectionColor: CColors.blue70,
      selectionHandleColor: CColors.blue70,
    ),
    textTheme: CTypography.cTextTheme.apply(
      displayColor: CColors.gray10,
      bodyColor: CColors.gray10,
    ),
  );
}
