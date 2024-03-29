import 'package:carbon/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

extension CThemeContextExtension on BuildContext {
  get cTheme {
    return this.fetch<CTheme>();
  }
}

extension CDoubleListExtension on List<double> {
  EdgeInsetsGeometry get padding {
    if (this.length == 1) {
      return EdgeInsets.all(this[0]);
    } else if (this.length == 2) {
      return EdgeInsets.symmetric(vertical: this[0], horizontal: this[1]);
    } else if (this.length == 4) {
      return EdgeInsets.only(top: this[0], right: this[1], bottom: this[2], left: this[3]);
    }

    throw Exception('[CDoubleListExtension] : list length should be 1, 2 or 4');
  }

  get margin => padding;
}
