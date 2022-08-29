import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CCheckboxExamplePage extends StatefulWidget {
  const CCheckboxExamplePage({Key? key}) : super(key: key);

  @override
  State<CCheckboxExamplePage> createState() => _CCheckboxExamplePageState();
}

class _CCheckboxExamplePageState extends State<CCheckboxExamplePage> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.gray100,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CText(
              data: 'Checkbox',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 64),
            CCheckbox(
              label: 'Checkbox Label',
              value: value,
              onChange: (value) {
                setState(() => value = !value);
              },
            ),
            const SizedBox(height: 24),
            CCheckbox(
              value: value,
              onChange: (value) {
                setState(() => value = !value);
              },
            ),
            const SizedBox(height: 24),
            CCheckbox(
              enable: false,
              label: 'Checkbox Label',
              value: value,
              onChange: (value) {
                setState(() => value = !value);
              },
            ),
            const SizedBox(height: 24),
            CCheckbox(
              enable: false,
              value: value,
              onChange: (value) {
                setState(() => value = !value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
