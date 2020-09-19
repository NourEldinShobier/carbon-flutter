import 'package:carbon/carbon.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final _materialTheme = ThemeData(
  scaffoldBackgroundColor: carbonColors.get<Color>('carbon-gray-100'),
  primaryColor: carbonColors.get<Color>('carbon-blue-60'),
  accentColor: carbonColors.get<Color>('carbon-gray-10'),
  disabledColor: carbonColors.get<Color>('carbon-gray-80'), // to define & test
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: carbonColors.get<Color>('carbon-gray-10'),
      fontFamily: carbonFonts.get<String>('carbon-font-family'),
    ),
  ),
);

final g100 = StyleX({
  'material-theme': _materialTheme,
})
  ..inject(carbonColors)
  ..inject(carbonFonts)
  ..inject(textG100);
