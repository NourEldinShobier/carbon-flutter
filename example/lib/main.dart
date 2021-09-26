import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final menu = COverflowMenuController();

  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 400, left: 100),
          child: COverflowMenuButton(
            items: [
              COverflowMenuItem(child: CText(data: 'Item')),
              COverflowMenuItem(child: CText(data: 'Item')),
              COverflowMenuItem(child: CText(data: 'Item')),
              COverflowMenuItem(
                child: CText(data: 'Item'),
                hasDivider: true,
              ),
              COverflowMenuItem(
                child: CText(data: 'Delete'),
                isDelete: true,
              ),
            ],
            icon: CIcon(CIcons.add, size: 16),
          ),
        ),
      ),
    );
  }
}
