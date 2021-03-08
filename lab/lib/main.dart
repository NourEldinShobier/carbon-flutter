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
  // make inerface for carbon icons, so that developers can implemnet it same features for custom icons 
  // for textfield, button, ... all widgets
  // to textfield cuz colorfilter wont work
  // handle textfield left and write icons, and when disabled color change if implement interface
  // textfield style is full of duplicated (refactor to reduce hashtable)
  // - mention that carbon flutter is not an official libaray
  abstract class IDisable {
     Color disableColor;
  }
    */
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 380,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: CForm(
              type: CFormType.group,
              label: 'Add',
              title: 'Student',
              titleSize: 24,
              description:
                  'Enter the student information, then click save. Enter the student information, then click save.Enter the student information, then click save.',
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CTextField(label: 'Name', isRequired: true),
                  const SizedBox(height: 16),
                  CTextField(label: 'E-mail', isRequired: true),
                  const SizedBox(height: 16),
                  CTextField(label: 'Adress', enabled: false),
                  const SizedBox(height: 16),
                  CCheckbox(
                    value: true,
                    label: 'Checkbox item',
                    labelSize: 16,
                    onChange: (v) {
                      print(v);
                    },
                  )
                  /* CButton(
                    onTap: () {},
                    label: 'Primary button',
                    icon: SvgPicture.asset(
                      'assets/svg/warning--alt--filled.svg',
                      height: 16,
                    ),
                  ), */
                ],
              ),
              actions: CButton(
                onTap: () {},
                label: 'Primary button',
                icon: SvgPicture.asset(
                  'assets/svg/warning--alt--filled.svg',
                  height: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
