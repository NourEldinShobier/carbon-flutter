import 'package:carbon/carbon.dart';

import 'package:flutter/material.dart';

class CarbonThemes {
  static final gray100 = {
    'theme': 'g100',
    'material-theme': ThemeData(
      scaffoldBackgroundColor: CColors.gray100,
      primaryColor: CColors.blue60,
      accentColor: CColors.gray10,
      disabledColor: CColors.gray70,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        bodyText2: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        headline1: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        headline2: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        headline3: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        headline4: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        headline5: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
        headline6: TextStyle(color: CColors.gray10, fontFamily: CFonts.primaryRegular),
      ),
    ),
  };
}
