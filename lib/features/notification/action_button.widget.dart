import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';
import 'package:pmvvm/pmvvm.dart';

import 'action_button.style.dart';

class CNotificationActionButton extends StatefulWidget {
  const CNotificationActionButton({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
    required this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final VoidCallback onTap;

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
        ),
        child: AnimatedContainer(
          duration: _layouts['$_cwidget-background-color-animation-duration'],
          curve: _layouts['$_cwidget-background-color-animation-curve'],
          height: widget.height,
          width: widget.width,
          alignment: Alignment.center,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _colors['$_cwidget-$_state-$_contrast-background-color'],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
