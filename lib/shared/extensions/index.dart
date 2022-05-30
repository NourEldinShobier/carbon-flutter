import 'package:carbon/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

extension CThemeContextExtension on BuildContext {
  get cTheme {
    return fetch<CTheme>();
  }
}
