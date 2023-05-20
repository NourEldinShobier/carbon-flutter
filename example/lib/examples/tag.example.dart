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
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TagsExample(
                title: 'default CTag widget',
                children: CTagColors.values
                    .map((color) => CTag(
                          label: color.name,
                          color: color,
                        ))
                    .toList(),
              ),
              TagsExample(
                title: 'CTag with filter (CTag.filter)',
                children: CTagColors.values
                    .map((color) => CTag.filter(
                          label: color.name,
                          color: color,
                        ))
                    .toList(),
              ),
              TagsExample(
                title: 'CTag with small size (CTag.size = CTagSize.sm)',
                children: CTagColors.values
                    .map((color) => CTag(
                          label: color.name,
                          color: color,
                          size: CTagSize.sm,
                        ))
                    .toList(),
              ),
              TagsExample(
                title: 'CTag with small size and filter',
                children: CTagColors.values
                    .map((color) => CTag.filter(
                          label: color.name,
                          color: color,
                          size: CTagSize.sm,
                        ))
                    .toList(),
              ),
              TagsExample(
                title: 'CTag with disabled state (CTag.disabled = true)',
                children: [
                  CTag(
                    label: 'Disabled',
                    disabled: true,
                  ),
                  CTag.filter(
                    label: 'Disabled',
                    disabled: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagsExample extends StatelessWidget {
  const TagsExample({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 40),
        Text(title),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: children,
        ),
      ],
    );
  }
}
