import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    /*
      // FIXME: problem in merge style in text, it overrides default dont, fix materialtheme
  // you can make icon color feature for instances of CCICONs only >> same problem will be applied
  // to textfield cuz colorfilter wont work
    */
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CButton(
                onTap: () {},
                type: CButtonType.primary,
                label: 'Primary button',
                icon: SvgPicture.asset(
                  'assets/svg/warning--alt--filled.svg',
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
