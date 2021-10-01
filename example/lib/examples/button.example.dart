import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';

class CButtonExample extends StatelessWidget {
  const CButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              CText(
                data: 'Carbon Button',
                style: TextStyle(
                  color: CColors.gray10,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    label: 'Carbon Button',
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    iconDescription: 'Icon description',
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    label: 'Carbon Button',
                    kind: CButtonKind.danger,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    iconDescription: 'Icon description',
                    kind: CButtonKind.danger,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    label: 'Carbon Button',
                    kind: CButtonKind.secondary,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    iconDescription: 'Icon description',
                    kind: CButtonKind.secondary,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    label: 'Carbon Button',
                    kind: CButtonKind.tertiary,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    iconDescription: 'Icon description',
                    kind: CButtonKind.tertiary,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CButton(
                    label: 'Carbon Button',
                    kind: CButtonKind.ghost,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    iconDescription: 'Icon description',
                    kind: CButtonKind.ghost,
                    icon: CIcon(CIcons.add, size: 16),
                    onTap: () {},
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
