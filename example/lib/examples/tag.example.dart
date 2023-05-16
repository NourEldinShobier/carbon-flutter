import 'package:carbon_flutter/features/tag/index.dart';
import 'package:flutter/material.dart';

class CTagExample extends StatelessWidget {
  const CTagExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(44),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: CTagColors.values
              .map((color) => CTag(
                    label: color.name,
                    color: color,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
