import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';

mixin TextUtils {
  TextStyle buildTextStyle({
    required CTextType? type,
    required Map<String, dynamic> colors,
    required Map<String, dynamic> layout,
  }) {
    final styleName = enumToString(type);

    final fontFamily = layout['text-$styleName-font-family'] as String?;
    final fontSize = layout['text-$styleName-font-size'] as double?;
    final color = colors['text-$styleName-color'] as Color?;

    return TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: color);
  }
}
