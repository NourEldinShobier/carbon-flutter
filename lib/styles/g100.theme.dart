import 'package:carbon/carbon.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final _materialTheme = ThemeData();

final g100 = StyleX({
  'material-theme': _materialTheme,
})
  ..inject(carbonColors)
  ..inject(carbonFonts)
  ..inject(textG100);
