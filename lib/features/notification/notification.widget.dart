import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.widget.dart';
import 'notification.enum.dart';

/// Notifications are messages that communicate information to the user.
///
/// The two main variants of notifications are toast notifications and
/// inline notifications.
class CNotification extends StatelessWidget {
  const CNotification.toast({
    Key? key,
    required this.title,
    required this.subtitle,
    this.caption,
    this.hideCloseButton = false,
    this.kind = CNotificationKind.info,
    this.lowContrast = true,
    this.onCloseButtonTap,
    this.onClose,
    this.timeout,
  })  : assert((timeout == null && onClose == null) || (timeout != null && onClose != null)),
        assert((hideCloseButton && onCloseButtonTap == null) || (!hideCloseButton && onCloseButtonTap != null)),
        _type = CNotificationType.toast,
        actions = null,
        super(key: key);

  const CNotification.inline({
    Key? key,
    required this.title,
    required this.subtitle,
    this.hideCloseButton = false,
    this.kind = CNotificationKind.info,
    this.lowContrast = true,
    this.onCloseButtonTap,
    this.onClose,
    this.timeout,
    this.actions,
  })  : assert((timeout == null && onClose == null) || (timeout != null && onClose != null)),
        assert((hideCloseButton && onCloseButtonTap == null) || (!hideCloseButton && onCloseButtonTap != null)),
        _type = CNotificationType.inline,
        caption = null,
        super(key: key);

  /// The title to display.
  final Widget title;

  /// The subtitle to display.
  final Widget subtitle;

  /// An optional caption to display.
  final Widget? caption;

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

  /// A list of [CNotificationActionButton] to display in a row when
  /// the [CNotification] is `inline`.
  final List<CNotificationActionButton>? actions;

  /// Whether [CNotification] is `toast` or `inline`.
  final CNotificationType _type;

  final _colors = CNotificationStyle.colors;
  final _layouts = CNotificationStyle.layouts;
  final _assets = CNotificationStyle.assets;

  void _startTimer() {
    Future.delayed(Duration(milliseconds: timeout!), () {
      onClose!();
    });
  }

  /// The method is used when the [_type] is [CNotificationType.inline]
  /// and it's called by [_buildInlineNotification]

  List<Widget> _buildActions() {
    final result = <Widget>[];

    actions!.forEach(
      (action) => result.addAll([action, const SizedBox(width: 8)]),
    );

    result.removeLast();

    return result;
  }

  Widget _buildInlineNotification() {
    /// styles helpers
    String cwidget = 'notification';
    String notificationKind = enumToString(kind);
    String contrast = lowContrast ? 'lowcontrast' : 'highcontrast';

    if (timeout != null) _startTimer();

    return Provider.value(
      value: contrast,
      child: Container(
        decoration: BoxDecoration(
          color: _colors['$cwidget-$contrast-background-color'],
          border: Border(
            top: lowContrast
                ? BorderSide(
                    width: _layouts['$cwidget-inline-$contrast-border-width'][0],
                    color: _colors['$cwidget-$notificationKind-border-color']!,
                  )
                : BorderSide.none,
            right: lowContrast
                ? BorderSide(
                    width: _layouts['$cwidget-inline-$contrast-border-width'][1],
                    color: _colors['$cwidget-$notificationKind-border-color']!,
                  )
                : BorderSide.none,
            bottom: lowContrast
                ? BorderSide(
                    width: _layouts['$cwidget-inline-$contrast-border-width'][2],
                    color: _colors['$cwidget-$notificationKind-border-color']!,
                  )
                : BorderSide.none,
            left: BorderSide(
              width: _layouts['$cwidget-inline-$contrast-border-width'][3],
              color: _colors['$cwidget-$notificationKind-border-color']!,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(14),
              child: CSVGIcon.asset(
                _assets['$cwidget-$contrast-$notificationKind-icon']!,
                package: 'carbon',
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: _layouts['$cwidget-padding'][0],
                  bottom: _layouts['$cwidget-padding'][2],
                ),
                child: Wrap(
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        color: _colors['$cwidget-$contrast-text-color'],
                        fontFamily: CFonts.primarySemibold,
                        package: 'carbon',
                      ),
                      child: title,
                    ),
                    const SizedBox(width: 4),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: _colors['$cwidget-$contrast-text-color'],
                        fontFamily: CFonts.primaryRegular,
                        package: 'carbon',
                      ),
                      child: subtitle,
                    ),
                  ],
                ),
              ),
            ),
            if (actions != null) ...[
              const SizedBox(width: 14),
              SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: _buildActions(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
            ],
            if (!hideCloseButton)
              CNotificationActionButton(
                onTap: onCloseButtonTap!,
                width: 48,
                height: 48,
                child: CSVGIcon.asset(
                  _assets['$cwidget-$contrast-close-icon']!,
                  package: 'carbon',
                  height: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildToastNotification() {
    /// styles helpers
    String cwidget = 'notification';
    String notificationKind = enumToString(kind);
    String contrast = lowContrast ? 'lowcontrast' : 'highcontrast';

    if (timeout != null) _startTimer();

    return Provider.value(
      value: contrast,
      child: Container(
        width: 288,
        decoration: BoxDecoration(
          color: _colors['$cwidget-$contrast-background-color'],
          border: Border(
            left: BorderSide(
              width: _layouts['$cwidget-toast-border-width'][3],
              color: _colors['$cwidget-$notificationKind-border-color']!,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(14),
              child: CSVGIcon.asset(
                _assets['$cwidget-$contrast-$notificationKind-icon']!,
                package: 'carbon',
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: _layouts['$cwidget-padding'][0],
                  bottom: _layouts['$cwidget-padding'][2],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: _colors['$cwidget-$contrast-text-color'],
                          fontFamily: CFonts.primarySemibold,
                          package: 'carbon',
                        ),
                        child: title,
                      ),
                    ),
                    Flexible(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: _colors['$cwidget-$contrast-text-color'],
                          fontFamily: CFonts.primaryRegular,
                          package: 'carbon',
                        ),
                        child: subtitle,
                      ),
                    ),
                    if (caption != null) ...[
                      const SizedBox(height: 24),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: _colors['$cwidget-$contrast-text-color'],
                          fontFamily: CFonts.primaryRegular,
                          package: 'carbon',
                        ),
                        child: caption!,
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(width: 14),
            if (!hideCloseButton)
              CNotificationActionButton(
                onTap: onCloseButtonTap!,
                width: 48,
                height: 48,
                child: CSVGIcon.asset(
                  _assets['$cwidget-$contrast-close-icon']!,
                  package: 'carbon',
                  height: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_type == CNotificationType.inline)
      return _buildInlineNotification();
    else
      return _buildToastNotification();
  }
}
