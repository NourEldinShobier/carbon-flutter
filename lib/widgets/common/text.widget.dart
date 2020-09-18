import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  const CText({Key key, @required this.props, this.style}) : super(key: key);

  final Map<String, dynamic> props;
  final Map<String, dynamic> style;

  @override
  Widget build(BuildContext context) {
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
      style: TextStyle(
        fontSize: style['fontSize'] ?? null,
        height: style['height'] ?? null,
        color: style['color'] ?? null,
        backgroundColor: style['backgroundColor'] ?? null,
        fontWeight: style['fontWeight'] ?? null,
        fontStyle: style['fontStyle'] ?? null,
        textBaseline: style['textBaseline'] ?? null,
        locale: style['locale'] ?? null,
        debugLabel: style['debugLabel'] ?? null,
      ),
    );
  }
}
