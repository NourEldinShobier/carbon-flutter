import 'package:flutter/widgets.dart';

import 'action_button.widget.dart';
import 'notification.enum.dart';

class CNotificationBaseProps {
  /// The title to display.
  final Widget title;

  /// The subtitle to display.
  final Widget subtitle;

  /// Whether the close button should be disabled, or not.
  final bool hideCloseButton;

  /// The state that the [CNotification] represents. It can be `error`,
  /// `info`, `success`, or `warning`.
  final CNotificationKind kind;

  /// Whether you are using the low contrast variant of the [CNotification].
  final bool lowContrast;

  /// Called when the close button is tapped.
  final VoidCallback? onCloseButtonTap;

  /// Called after the given [timeout] duration has passed.
  final VoidCallback? onClose;

  /// An optional duration (milliseconds) to determine the amount of time
  /// the [CNotification] should be displayed.
  ///
  /// When the duration is finished, [onClose] is called.
  final int? timeout;

  CNotificationBaseProps({
    required this.title,
    required this.subtitle,
    required this.hideCloseButton,
    required this.kind,
    required this.lowContrast,
    required this.onCloseButtonTap,
    required this.onClose,
    required this.timeout,
  });
}

class CNotificationToastProps extends CNotificationBaseProps {
  /// An optional caption to display.
  final Widget? caption;

  CNotificationToastProps({
    required this.caption,
    required Widget title,
    required Widget subtitle,
    required bool hideCloseButton,
    required CNotificationKind kind,
    required bool lowContrast,
    required VoidCallback? onCloseButtonTap,
    required VoidCallback? onClose,
    required int? timeout,
  }) : super(
          title: title,
          subtitle: subtitle,
          hideCloseButton: hideCloseButton,
          kind: kind,
          lowContrast: lowContrast,
          onCloseButtonTap: onCloseButtonTap,
          onClose: onClose,
          timeout: timeout,
        );
}

class CNotificationInlineProps extends CNotificationBaseProps {
  /// A list of [CNotificationActionButton] to display in a row when
  /// the [CNotification] is `inline`.
  final List<CNotificationActionButton>? actions;

  CNotificationInlineProps({
    required this.actions,
    required Widget title,
    required Widget subtitle,
    required bool hideCloseButton,
    required CNotificationKind kind,
    required bool lowContrast,
    required VoidCallback? onCloseButtonTap,
    required VoidCallback? onClose,
    required int? timeout,
  }) : super(
          title: title,
          subtitle: subtitle,
          hideCloseButton: hideCloseButton,
          kind: kind,
          lowContrast: lowContrast,
          onCloseButtonTap: onCloseButtonTap,
          onClose: onClose,
          timeout: timeout,
        );
}

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
