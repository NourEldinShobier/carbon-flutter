import 'package:flutter/widgets.dart';
import 'package:carbon/carbon.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.widget.dart';
import 'notification.enum.dart';
import 'notification.props.dart';

/// Notifications are messages that communicate information to the user.
///
/// The two main variants of notifications are toast notifications and
/// inline notifications.
class CNotification extends StatelessWidget {
  CNotification.toast({
    Key? key,
    required Widget title,
    required Widget subtitle,
    Widget? caption,
    bool hideCloseButton = false,
    CNotificationKind kind = CNotificationKind.info,
    bool lowContrast = true,
    VoidCallback? onCloseButtonTap,
    VoidCallback? onClose,
    int? timeout,
  })  : assert((timeout == null && onClose == null) || (timeout != null && onClose != null)),
        assert((hideCloseButton && onCloseButtonTap == null) || (!hideCloseButton && onCloseButtonTap != null)),
        props = CNotificationToastProps(
          caption: caption,
          title: title,
          subtitle: subtitle,
          hideCloseButton: hideCloseButton,
          kind: kind,
          lowContrast: lowContrast,
          onCloseButtonTap: onCloseButtonTap,
          onClose: onClose,
          timeout: timeout,
        ),
        _type = CNotificationType.toast,
        super(key: key);

  CNotification.inline({
    Key? key,
    required Widget title,
    required Widget subtitle,
    Widget? caption,
    bool hideCloseButton = false,
    CNotificationKind kind = CNotificationKind.info,
    bool lowContrast = true,
    VoidCallback? onCloseButtonTap,
    VoidCallback? onClose,
    int? timeout,
    List<CNotificationActionButton>? actions,
  })  : assert((timeout == null && onClose == null) || (timeout != null && onClose != null)),
        assert((hideCloseButton && onCloseButtonTap == null) || (!hideCloseButton && onCloseButtonTap != null)),
        props = CNotificationInlineProps(
          actions: actions,
          title: title,
          subtitle: subtitle,
          hideCloseButton: hideCloseButton,
          kind: kind,
          lowContrast: lowContrast,
          onCloseButtonTap: onCloseButtonTap,
          onClose: onClose,
          timeout: timeout,
        ),
        _type = CNotificationType.inline,
        super(key: key);

  final CNotificationBaseProps props;

  /// Whether [CNotification] is `toast` or `inline`.
  final CNotificationType _type;

  @override
  Widget build(BuildContext context) {
    if (_type == CNotificationType.inline)
      return _CNotificationInline(props: props as CNotificationInlineProps);
    else
      return _CNotificationToast(props: props as CNotificationToastProps);
  }
}

class _CNotificationInline extends StatelessWidget {
  _CNotificationInline({Key? key, required this.props}) : super(key: key);

  final CNotificationInlineProps props;

  final _styles = CNotificationStyle.styles;
  final _assets = CNotificationStyle.assets;

  void _startTimer() {
    Future.delayed(Duration(milliseconds: props.timeout!), () {
      props.onClose!();
    });
  }

  List<Widget> _buildActions() {
    final result = <Widget>[];

    props.actions!.forEach(
      (action) => result.addAll([action, const SizedBox(width: 8)]),
    );

    result.removeLast();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    /// styles helpers
    String notificationKind = enumToString(props.kind);
    String contrast = props.lowContrast ? 'lowcontrast' : 'highcontrast';

    if (props.timeout != null) _startTimer();

    return Provider.value(
      value: contrast,
      child: Container(
        decoration: BoxDecoration(
          color: _styles['notification-$contrast-background-color'],
          border: Border(
            top: props.lowContrast
                ? BorderSide(
                    width: _styles['notification-inline-$contrast-border-width'][0],
                    color: _styles['notification-$notificationKind-border-color']!,
                  )
                : BorderSide.none,
            right: props.lowContrast
                ? BorderSide(
                    width: _styles['notification-inline-$contrast-border-width'][1],
                    color: _styles['notification-$notificationKind-border-color']!,
                  )
                : BorderSide.none,
            bottom: props.lowContrast
                ? BorderSide(
                    width: _styles['notification-inline-$contrast-border-width'][2],
                    color: _styles['notification-$notificationKind-border-color']!,
                  )
                : BorderSide.none,
            left: BorderSide(
              width: _styles['notification-inline-$contrast-border-width'][3],
              color: _styles['notification-$notificationKind-border-color']!,
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
                _assets['notification-$contrast-$notificationKind-icon']!,
                package: 'carbon',
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: _styles['notification-padding'][0],
                  bottom: _styles['notification-padding'][2],
                ),
                child: Wrap(
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        color: _styles['notification-$contrast-text-color'],
                        fontFamily: CFonts.primarySemibold,
                        package: 'carbon',
                      ),
                      child: props.title,
                    ),
                    const SizedBox(width: 4),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: _styles['notification-$contrast-text-color'],
                        fontFamily: CFonts.primaryRegular,
                        package: 'carbon',
                      ),
                      child: props.subtitle,
                    ),
                  ],
                ),
              ),
            ),
            if (props.actions != null) ...[
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
            if (!props.hideCloseButton)
              CNotificationActionButton(
                onTap: props.onCloseButtonTap!,
                width: 48,
                height: 48,
                child: CSVGIcon.asset(
                  _assets['notification-$contrast-close-icon']!,
                  package: 'carbon',
                  height: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CNotificationToast extends StatelessWidget {
  const _CNotificationToast({Key? key, required this.props}) : super(key: key);

  final CNotificationToastProps props;

  final _styles = CNotificationStyle.styles;
  final _assets = CNotificationStyle.assets;

  void _startTimer() {
    Future.delayed(Duration(milliseconds: props.timeout!), () {
      props.onClose!();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// styles helpers
    String notificationKind = enumToString(props.kind);
    String contrast = props.lowContrast ? 'lowcontrast' : 'highcontrast';

    if (props.timeout != null) _startTimer();

    return Provider.value(
      value: contrast,
      child: Container(
        width: 288,
        decoration: BoxDecoration(
          color: _styles['notification-$contrast-background-color'],
          border: Border(
            left: BorderSide(
              width: _styles['notification-toast-border-width'][3],
              color: _styles['notification-$notificationKind-border-color']!,
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
                _assets['notification-$contrast-$notificationKind-icon']!,
                package: 'carbon',
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: _styles['notification-padding'][0],
                  bottom: _styles['notification-padding'][2],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: _styles['notification-$contrast-text-color'],
                          fontFamily: CFonts.primarySemibold,
                          package: 'carbon',
                        ),
                        child: props.title,
                      ),
                    ),
                    Flexible(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: _styles['notification-$contrast-text-color'],
                          fontFamily: CFonts.primaryRegular,
                          package: 'carbon',
                        ),
                        child: props.subtitle,
                      ),
                    ),
                    if (props.caption != null) ...[
                      const SizedBox(height: 24),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: _styles['notification-$contrast-text-color'],
                          fontFamily: CFonts.primaryRegular,
                          package: 'carbon',
                        ),
                        child: props.caption!,
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(width: 14),
            if (!props.hideCloseButton)
              CNotificationActionButton(
                onTap: props.onCloseButtonTap!,
                width: 48,
                height: 48,
                child: CSVGIcon.asset(
                  _assets['notification-$contrast-close-icon']!,
                  package: 'carbon',
                  height: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
