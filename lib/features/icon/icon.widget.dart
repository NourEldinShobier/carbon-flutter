import 'package:flutter/widgets.dart';

/// A graphical icon widget drawn with a glyph from a font described in
/// an [IconData] such as material's predefined [IconData]s in [Icons].
class CIcon extends StatelessWidget {
  const CIcon(
    this.icon, {
    Key? key,
    this.enable = true,
    this.size,
    this.color,
    this.disableColor,
  }) : super(key: key);

  /// An icon to display
  final IconData icon;

  /// Whether the icon is enabled or not.
  final bool enable;

  /// The size of the icon in logical pixels.
  final double? size;

  /// The color to use when drawing the icon.
  final Color? color;

  /// The color to use when the icon is disabled.
  final Color? disableColor;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: enable ? color : disableColor);
  }
}
