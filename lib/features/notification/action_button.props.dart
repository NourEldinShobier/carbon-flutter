import 'package:flutter/widgets.dart';

class CNotificationActionButtonProps {
  /// The content of the action button.
  final Widget child;

  /// Called when the action button is tapped.
  final VoidCallback onTap;

  /// The width of the action button. If it's null, the action button will
  /// size itself to the [child].
  final double? width;

  /// The height of the action button. If it's null, the action button will
  /// size itself to the [child].
  final double? height;

  CNotificationActionButtonProps({
    required this.child,
    required this.onTap,
    required this.width,
    required this.height,
  });
}
