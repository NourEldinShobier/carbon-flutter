import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.style.dart';

/// A ghost button action for inline notifications that is adjacent
/// to the title and body content.
class CNotificationActionButton extends StatefulWidget {
  const CNotificationActionButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

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
      onTap: widget.onTap,
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
          height: widget.height,
          width: widget.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _colors['$_cwidget-$_state-$_contrast-background-color'],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
