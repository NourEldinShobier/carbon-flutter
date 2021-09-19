import 'package:flutter/widgets.dart';

class CIcon extends StatelessWidget {
  const CIcon(
    this.icon, {
    Key? key,
    this.enable = true,
    this.size,
    this.color,
    this.disableColor,
  }) : super(key: key);

  final IconData? icon;

  final bool enable;
  final double? size;
  final Color? color;
  final Color? disableColor;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: enable ? color : disableColor);
  }
}
