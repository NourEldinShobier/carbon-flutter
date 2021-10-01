import 'package:carbon/carbon.dart';
import 'package:example/examples/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      title: 'Carbon Examples',
      home: CBreadcrumbExample(),
    );
  }
}
