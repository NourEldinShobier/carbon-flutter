import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.widget.dart';
import 'notification.props.dart';
import 'notification.styles.dart';

enum CNotificationKind { error, info, success, warning }

enum CNotificationType { inline, toast }

enum CNotificationContrast { high, low }

typedef _Styles = CNotificationStyles;
typedef _Assets = CNotificationAssets;

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
    CNotificationContrast contrast = CNotificationContrast.low,
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
          contrast: contrast,
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
    CNotificationContrast contrast = CNotificationContrast.low,
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
          contrast: contrast,
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
    if (_type == CNotificationType.inline) {
      return _CNotificationInline(props: props as CNotificationInlineProps);
    } else {
      return _CNotificationToast(props: props as CNotificationToastProps);
    }
  }
}

class _CNotificationInline extends StatelessWidget {
  const _CNotificationInline({Key? key, required this.props}) : super(key: key);

  final CNotificationInlineProps props;

  void _startTimer() {
    Future.delayed(Duration(milliseconds: props.timeout!), () {
      props.onClose!();
    });
  }

  List<Widget> _buildActions() {
    final result = <Widget>[];

    for (var action in props.actions!) {
      result.addAll([action, const SizedBox(width: 8)]);
    }

    result.removeLast();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final CNotificationKind kind = props.kind;
    final CNotificationContrast contrast = props.contrast;

    if (props.timeout != null) _startTimer();

    return Provider.value(
      value: contrast,
      child: Container(
        decoration: BoxDecoration(
          color: _Styles.backgroundColor[contrast],
          border: _Styles.inlineNotificationBorder[contrast]![kind]!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(14),
              child: SvgPicture.asset(_Assets.kindIcon[contrast]![kind]!, package: 'carbon'),
            ),
            Expanded(
              child: Padding(
                padding: _Styles.contentPadding,
                child: Wrap(
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        color: _Styles.textColor[contrast],
                        fontFamily: CFonts.primarySemibold,
                        package: 'carbon',
                      ),
                      child: props.title,
                    ),
                    const SizedBox(width: 4),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: _Styles.textColor[contrast],
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
                child: SvgPicture.asset(_Assets.closeIcon[contrast]!, package: 'carbon', height: 20),
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

  void _startTimer() {
    Future.delayed(Duration(milliseconds: props.timeout!), () {
      props.onClose!();
    });
  }

  @override
  Widget build(BuildContext context) {
    final CNotificationKind kind = props.kind;
    final CNotificationContrast contrast = props.contrast;

    if (props.timeout != null) _startTimer();

    return Provider.value(
      value: contrast,
      child: Container(
        width: 288,
        decoration: BoxDecoration(
          color: _Styles.backgroundColor[contrast],
          border: _Styles.toastNotificationBorder[kind]!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(14),
              child: SvgPicture.asset(_Assets.kindIcon[contrast]![kind]!, package: 'carbon'),
            ),
            Expanded(
              child: Padding(
                padding: _Styles.contentPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: _Styles.textColor[contrast],
                          fontFamily: CFonts.primarySemibold,
                          package: 'carbon',
                        ),
                        child: props.title,
                      ),
                    ),
                    Flexible(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: _Styles.textColor[contrast],
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
                          color: _Styles.textColor[contrast],
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
                child: SvgPicture.asset(_Assets.closeIcon[contrast]!, package: 'carbon', height: 20),
              ),
          ],
        ),
      ),
    );
  }
}
