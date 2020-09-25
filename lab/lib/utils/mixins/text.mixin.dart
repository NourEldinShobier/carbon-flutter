import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

mixin TextUtils {
  TextStyle buildTextStyle({CTextType type, StyleX style}) {
    final styleName = enumToString(type);

    final fontFamily = style.get<String>('text-$styleName-font-family');
    final fontSize = style.get<double>('text-$styleName-font-size');
    final color = style.get<Color>('text-$styleName-color');

    return TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: color);
  }
}
