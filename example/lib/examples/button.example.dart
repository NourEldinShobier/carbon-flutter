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
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
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
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.danger,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
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
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.secondary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
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
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.tertiary,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
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
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  CButton.icon(
                    kind: CButtonKind.ghost,
                    icon: Builder(
                      builder: (ctx) => Icon(CIcons.add, size: 16, color: ctx.styles['button-content-color']),
                    ),
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
