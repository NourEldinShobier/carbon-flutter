import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

abstract class CTypography {
  static const cTextTheme = TextTheme(
    headline1: TextStyle(fontFamily: CFonts.primaryLight, package: 'carbon'),
    headline2: TextStyle(fontFamily: CFonts.primaryLight, package: 'carbon'),
    headline3: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    headline4: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    headline5: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    headline6: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon'),
    subtitle1: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    subtitle2: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon'),
    bodyText1: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    bodyText2: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    button: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon'),
    caption: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    overline: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
  );
}
