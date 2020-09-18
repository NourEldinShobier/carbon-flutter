import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  const CText({Key key, @required this.props}) : super(key: key);

  final Map<String, dynamic> props;

  @override
  Widget build(BuildContext context) {
    return Text(
      props['value'] ?? 'none',
      textAlign: props['textAlign'] ?? null,
      maxLines: props['maxLines'] ?? null,
      overflow: props['overflow'] ?? null,
      style: TextStyle(
        fontSize: props['fontSize'] ?? null,
        fontFamily: props['fontFamily'] ?? null,
        height: props['height'] ?? null,
        color: props['color'] ?? null,
      ),
    );
  }
}
