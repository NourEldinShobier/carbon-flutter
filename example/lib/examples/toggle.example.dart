import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';

class CToggleExamplePage extends StatelessWidget {
  const CToggleExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.gray100,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CText(
              data: 'Large Toggles',
              style: TextStyle(
                color: CColors.gray10,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            _LargeToggles(),
            SizedBox(height: 24),
            CText(
              data: 'Small Toggles',
              style: TextStyle(
                color: CColors.gray10,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            _SmallToggles(),
            SizedBox(height: 24),
            CText(
              data: 'Labelled Toggles',
              style: TextStyle(
                color: CColors.gray10,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            _LabelledToggles(),
          ],
        ),
      ),
    );
  }
}

class _SmallToggles extends StatelessWidget {
  const _SmallToggles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CToggle(
              onToggle: (v) {},
              size: CToggleSize.sm,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              value: false,
              size: CToggleSize.sm,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              showStatusLabel: false,
              size: CToggleSize.sm,
            ),
            const SizedBox(height: 8),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CToggle(
              onToggle: (v) {},
              enable: false,
              size: CToggleSize.sm,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              value: false,
              enable: false,
              size: CToggleSize.sm,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              enable: false,
              showStatusLabel: false,
              size: CToggleSize.sm,
            ),
          ],
        )
      ],
    );
  }
}

class _LargeToggles extends StatelessWidget {
  const _LargeToggles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CToggle(
              onToggle: (v) {},
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              value: false,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              showStatusLabel: false,
            ),
            const SizedBox(height: 8),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CToggle(
              onToggle: (v) {},
              enable: false,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              value: false,
              enable: false,
            ),
            const SizedBox(height: 8),
            CToggle(
              onToggle: (v) {},
              enable: false,
              showStatusLabel: false,
            ),
          ],
        )
      ],
    );
  }
}

class _LabelledToggles extends StatelessWidget {
  const _LabelledToggles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CToggle(
          onToggle: (v) {},
          labelText: 'Label text',
        ),
        const SizedBox(height: 16),
        CToggle(
          onToggle: (v) {},
          size: CToggleSize.sm,
          labelText: 'Label text',
        ),
      ],
    );
  }
}
