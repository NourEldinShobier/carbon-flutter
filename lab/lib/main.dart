import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarbonApp(
      theme: CarbonThemes.gray100,
      title: 'Carbon Lab',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

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
          width: 380,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CBreadcrumb(
                  children: [
                    CBreadcrumbItem(
                      onTap: () {},
                      child: Text('Terminal'),
                    ),
                    CBreadcrumbItem(
                      onTap: () {},
                      child: Text('Students'),
                    ),
                    CBreadcrumbItem(
                      onTap: () {},
                      child: Text('Data'),
                    ),
                    CBreadcrumbItem(
                      onTap: () {},
                      child: Text('Terminal'),
                    ),
                    CBreadcrumbItem(
                      onTap: () {},
                      child: Text('Students'),
                    ),
                    CBreadcrumbItem(
                      onTap: () {},
                      child: Text('Data'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
