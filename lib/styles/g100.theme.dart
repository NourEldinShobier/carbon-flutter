import 'styles.index.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final g100MaterialTheme = ThemeData();

final g100 = StyleX({
  'material-theme': g100MaterialTheme,
})
  ..inject(carbonColors)
  ..inject(carbonText);
