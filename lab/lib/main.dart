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
                /*  enabled: false,
                readOnly: true, */
                hint: 'Enter course name...',
                description: 'Hello World',
                validator: (value) {
                  if (value == 'Nour')
                    return CValidationResult(
                      type: CValidationResultType.error,
                      message: 'This is a valid user name.',
                      icon: SvgPicture.asset(
                        'assets/svg/checkmark--filled.svg',
                        height: 18,
                        color: Color(0xFF42BE65),
                      ),
                    );
                  else
                    return null;
                },
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
