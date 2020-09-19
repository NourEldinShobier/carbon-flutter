import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';

class CLink extends StatelessWidget {
  const CLink({Key key, @required this.props}) : super(key: key);

  final Map<String, dynamic> props;

  @override
  Widget build(BuildContext context) {
    final url = props['url'] as String;
    final onTap = props['onTap'] as void Function(String url);

    return GestureDetector(
      onTap: () {
        onTap(url);
      },
      child: CText(
        props: {
          'value': props['caption'],
          'textType': TextType.link,
          'style': props['style'],
        },
      ),
    );
  }
}
