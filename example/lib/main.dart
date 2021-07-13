import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';

import 'examples/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      title: 'Flutter Demo',
      home: CNotificationExample(),
    );
  }
}
