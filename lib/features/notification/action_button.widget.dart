import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.props.dart';
import 'action_button.styles.dart';
import 'notification.widget.dart';

typedef _Styles = CNotificationActionButtonStyles;

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
  CNotificationActionButtonState createState() => CNotificationActionButtonState();
}

class CNotificationActionButtonState extends State<CNotificationActionButton> {
  CWidgetState _state = CWidgetState.enabled;

  late CNotificationContrast _contrast;

  void _setStateVariables() {
    _contrast = context.fetch<CNotificationContrast>();
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return GestureDetector(
      onTap: widget.props.onTap,
      onTapDown: (_) => setState(() => _state = CWidgetState.focused),
      onTapUp: (_) => setState(() => _state = CWidgetState.enabled),
      onTapCancel: () => setState(() => _state = CWidgetState.enabled),
      child: DefaultTextStyle(
        style: TextStyle(
          color: _Styles.textColor[_contrast],
          fontFamily: CFonts.primaryRegular,
          package: 'carbon',
        ),
        child: AnimatedContainer(
          duration: _Styles.animation['duration'],
          curve: _Styles.animation['curve'],
          height: widget.props.height,
          width: widget.props.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: _Styles.backgroundColor[_state]![_contrast]),
          child: widget.props.child,
        ),
      ),
    );
  }
}
