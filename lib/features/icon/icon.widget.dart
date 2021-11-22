import 'package:flutter/widgets.dart';
import 'package:carbon/features/inherited_styles/index.dart';
import 'package:carbon/features/enable/index.dart';

/// A graphical icon widget drawn with a glyph from a font described in
/// an [IconData] such as material's predefined [IconData]s in [Icons].
class CIcon extends StatelessWidget {
  const CIcon(
    this.icon, {
    Key? key,
    this.enable = true,
    this.inheritStyles = true,
    this.size,
    this.color,
    this.disableColor,
  }) : super(key: key);

  /// An icon to display
  final IconData icon;

  /// Whether the icon is enabled or not.
  final bool enable;

  /// Whether if the icon should inherit its styles from a [CInheritedStyles]
  /// widget or not.
  ///
  /// Such attribute comes handy if the icon styles are manipulated
  /// by a parent widget that maintans a [CInheritedStyles] within.
  final bool inheritStyles;

  /// The size of the icon in logical pixels.
  final double? size;

  /// The color to use when drawing the icon.
  final Color? color;

  /// The color to use when the icon is disabled.
  final Color? disableColor;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? enable : false;
  }

  Color? _color(BuildContext context) {
    final isEnabled = _isEnabled(context);

    if (inheritStyles) {
      if (isEnabled) {
        return context.styles['icon-enabled-color'] ?? color;
      }

      return context.styles['icon-disabled-color'] ?? disableColor;
    }

    return isEnabled ? color : disableColor;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: _color(context));
  }
}
