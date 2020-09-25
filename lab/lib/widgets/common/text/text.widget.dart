import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

export './text.style.dart';

class CText extends StatelessWidget with TextUtils {
  const CText({
    Key key,
    @required this.data,
    this.textType,
    this.textSpan,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  final CTextType textType;

  final String data;
  final InlineSpan textSpan;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior textHeightBehavior;

  @override
  Widget build(BuildContext context) {
    final carbon = context.style;

    TextStyle finalStyle;

    if (textType != null) {
      finalStyle = buildTextStyle(type: textType, style: carbon);
      if (style != null) finalStyle.merge(style);
    }

    return Text(
      data,
      style: finalStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
