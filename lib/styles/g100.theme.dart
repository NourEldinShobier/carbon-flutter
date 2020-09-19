import 'package:carbon/carbon.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final _materialTheme = ThemeData();
//text default colors will be in material theme G100
// text default disabled color

final g100 = StyleX({
  'material-theme': _materialTheme,
})
  ..inject(carbonColors)
  ..inject(carbonFonts)
  ..inject(textG100)
  ..inject(linkG100);
