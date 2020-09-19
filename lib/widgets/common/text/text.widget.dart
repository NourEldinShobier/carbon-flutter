import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

export './text.style.dart';
export './text.params.dart';

class CText extends StatelessWidget {
  const CText({Key key, @required this.props}) : super(key: key);

  final Map<String, dynamic> props;

  @override
  Widget build(BuildContext context) {
    final carbon = context.style;

    final style = props['style'] as TextStyle;
    final type = props['textType'] as TextType;

    if (type != null) {
      final finalStyle = TextUtils.buildTextStyle(type: type, style: carbon);
      if (style != null) finalStyle.merge(style);
      props['style'] = finalStyle;
    }

    return Text(
      props['value'] ?? 'none',
      textAlign: props['textAlign'] ?? null,
      maxLines: props['maxLines'] ?? null,
      overflow: props['overflow'] ?? null,
      textDirection: props['textDirection'] ?? null,
      locale: props['locale'] ?? null,
      textScaleFactor: props['textScaleFactor'] ?? null,
      semanticsLabel: props['semanticsLabel'] ?? null,
      textWidthBasis: props['textWidthBasis'] ?? null,
      textHeightBehavior: props['textHeightBehavior'] ?? null,
      strutStyle: props['strutStyle'] ?? null,
      softWrap: props['softWrap'] ?? null,
      style: props['style'] ?? null,
    );
  }
}
