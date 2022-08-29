import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon.dart';

class CLinkExamplePage extends StatefulWidget {
  const CLinkExamplePage({Key? key}) : super(key: key);

  @override
  State<CLinkExamplePage> createState() => _CLinkExamplePageState();
}

class _CLinkExamplePageState extends State<CLinkExamplePage> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.gray100,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CLink(
              url: 'www.google.com',
              onTap: (url) {},
            ),
            const SizedBox(height: 16),
            CLink(
              url: 'www.google.com',
              caption: 'Google',
              onTap: (url) {},
            ),
            const SizedBox(height: 16),
            CLink(
              enable: false,
              caption: 'Google',
              url: 'www.google.com',
              onTap: (url) {},
            )
          ],
        ),
      ),
    );
  }
}
