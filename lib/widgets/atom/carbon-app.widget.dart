import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

class CarbonApp extends StatelessWidget {
  const CarbonApp({Key key, @required this.theme}) : super(key: key);

  final StyleX theme;

  @override
  Widget build(BuildContext context) {
    return StyleStore(
      style: theme,
      child: MaterialApp(),
    );
  }
}
