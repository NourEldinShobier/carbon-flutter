import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'button.enum.dart';

class CButtonBaseProps {
  final bool enable;
  final CButtonKind kind;
  final CButtonSize size;
  final VoidCallback onTap;

  CButtonBaseProps({
    required this.enable,
    required this.kind,
    required this.size,
    required this.onTap,
  });
}

class CButtonRegularProps extends CButtonBaseProps {
  final Widget? icon;
  final bool expand;
  final String label;
  final double labelSize;

  CButtonRegularProps({
    required this.icon,
    required this.expand,
    required this.label,
    required this.labelSize,
    required bool enable,
    required CButtonKind kind,
    required CButtonSize size,
    required VoidCallback onTap,
  }) : super(enable: enable, kind: kind, size: size, onTap: onTap);
}

class CButtonIconOnlyProps extends CButtonBaseProps {
  final Widget icon;
  final CTooltipAlignment? cTooltipAlignment;
  final CTooltipPosition? tooltipPosition;
  final String iconDescription;

  CButtonIconOnlyProps({
    required this.icon,
    required this.cTooltipAlignment,
    required this.tooltipPosition,
    required this.iconDescription,
    required bool enable,
    required CButtonKind kind,
    required CButtonSize size,
    required VoidCallback onTap,
  }) : super(enable: enable, kind: kind, size: size, onTap: onTap);
}
