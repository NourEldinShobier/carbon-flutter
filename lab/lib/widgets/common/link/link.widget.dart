import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';

class CLink extends StatelessWidget {
  const CLink({
    Key key,
    @required this.url,
    @required this.onTap,
    this.caption,
    this.style,
  }) : super(key: key);

  final String caption;
  final String url;
  final void Function(String url) onTap;

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(url),
      child: CText(
        data: caption ?? url,
        textType: CTextType.link,
        style: style,
      ),
    );
  }
}
