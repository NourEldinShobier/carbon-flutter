import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'button.widget.dart';

class CButtonBaseProps {
  /// Called when the button is tapped.
  ///
  /// @required
  final VoidCallback onTap;

  /// Whether the toggle is enabled or not.
  ///
  /// @default: `true`
  final bool enable;

  /// The kind that the button represents. It can be `primary,
  /// secondary, danger, tertiary, ghost`.
  ///
  /// @default: `CButtonKind.primary`
  final CButtonKind kind;

  /// The size of this button. It can be `regular, sm, md`.
  ///
  /// @default: `CToggleSize.regular`
  final CButtonSize size;

  CButtonBaseProps({
    required this.enable,
    required this.kind,
    required this.size,
    required this.onTap,
  });
}

class CButtonRegularProps extends CButtonBaseProps {
  /// A text to display in the button.
  ///
  /// @required
  final String label;

  /// An optional icon to display in the button.
  ///
  /// @optional
  final Widget? icon;

  /// Whether the button should fill the available width.
  ///
  /// @default: `false`
  final bool expand;

  /// The size (in logical pixels) to use when painting the label.
  ///
  /// @default: `14.0`
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
  /// An icon to display in the button.
  ///
  /// @required
  final Widget icon;

  /// A text to display in a tooltip when the button is
  /// long pressed.
  ///
  /// @required
  final String iconDescription;

  /// The tooltip alignment, it can be `start, center, end`.
  ///
  /// @optional
  final CTooltipAlignment? tooltipAlignment;

  /// The tooltip position, it can be `top, right, bottom, left`.
  ///
  /// @optional
  final CTooltipPosition? tooltipPosition;

  CButtonIconOnlyProps({
    required this.icon,
    required this.tooltipAlignment,
    required this.tooltipPosition,
    required this.iconDescription,
    required bool enable,
    required CButtonKind kind,
    required CButtonSize size,
    required VoidCallback onTap,
  }) : super(enable: enable, kind: kind, size: size, onTap: onTap);
}
