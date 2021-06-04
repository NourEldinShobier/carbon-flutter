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
                CButton(
                  onTap: () {},
                  label: 'Button',
                  type: CButtonType.primary,
                  hasIconOnly: true,
                  icon: CSVGIcon.asset(
                    'assets/svg/warning--alt--filled.svg',
                    height: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(
                  onTap: () {},
                  label: 'Button',
                  type: CButtonType.secondary,
                  hasIconOnly: true,
                  icon: CSVGIcon.asset(
                    'assets/svg/warning--alt--filled.svg',
                    height: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(
                  onTap: () {},
                  label: 'Button',
                  type: CButtonType.danger,
                  hasIconOnly: true,
                  icon: CSVGIcon.asset(
                    'assets/svg/warning--alt--filled.svg',
                    height: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(
                  onTap: () {},
                  label: 'Button',
                  type: CButtonType.tertiary,
                  hasIconOnly: true,
                  icon: CSVGIcon.asset(
                    'assets/svg/warning--alt--filled.svg',
                    height: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(
                  onTap: () {},
                  label: 'Button',
                  type: CButtonType.ghost,
                  hasIconOnly: true,
                  icon: CSVGIcon.asset(
                    'assets/svg/warning--alt--filled.svg',
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
