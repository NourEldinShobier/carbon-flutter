import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';
import 'package:lab/styles/g100.theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      theme: g100,
      title: 'Carbon Lab',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CTextField(
                label: 'Course',
                isRequired: true,
                /* enabled: false, */
                hint: 'Enter course name',
                description: 'Hello World',
              ),
              const SizedBox(height: 16),
              CTextField(
                hint: 'Enter course name...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
