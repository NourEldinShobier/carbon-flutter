import 'package:flutter/material.dart';

import 'examples/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CFormExample(),
    );
  }
}
