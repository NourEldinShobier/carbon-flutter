import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.style.dart';
import 'notification.props.dart';

/// A ghost button action for inline notifications that is adjacent
/// to the title and body content.
class CNotificationActionButton extends StatefulWidget {
  CNotificationActionButton({
    Key? key,
    required Widget child,
    required VoidCallback onTap,
    double? width,
    double? height,
  })  : props = CNotificationActionButtonProps(
          child: child,
          onTap: onTap,
          width: width,
          height: height,
        ),
        super(key: key);

  final CNotificationActionButtonProps props;

  @override
  _CNotificationActionButtonState createState() => _CNotificationActionButtonState();
}

class _CNotificationActionButtonState extends State<CNotificationActionButton> {
  final _colors = CNotificationActionButtonStyle.colors;
  final _layouts = CNotificationActionButtonStyle.layouts;

  /// styles helpers
  String _cwidget = 'action-button';
  String _state = enumToString(CWidgetState.enabled);
  String _contrast = '';

  void _evaluateStateVariables() {
    _contrast = context.fetch<String>();
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return GestureDetector(
      onTap: widget.props.onTap,
      onTapDown: (_) => setState(() => _state = enumToString(CWidgetState.focus)),
      onTapUp: (_) => setState(() => _state = enumToString(CWidgetState.enabled)),
      onTapCancel: () => setState(() => _state = enumToString(CWidgetState.enabled)),
      child: DefaultTextStyle(
        style: TextStyle(
          color: _colors['$_cwidget-$_contrast-text-color'],
          fontFamily: CFonts.primaryRegular,
          package: 'carbon',
        ),
        child: AnimatedContainer(
          duration: _layouts['$_cwidget-background-color-animation-duration'],
          curve: _layouts['$_cwidget-background-color-animation-curve'],
          height: widget.props.height,
          width: widget.props.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _colors['$_cwidget-$_state-$_contrast-background-color'],
          ),
          child: widget.props.child,
        ),
      ),
    );
  }
}
