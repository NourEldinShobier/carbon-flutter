import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';
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

  var _state = CWidgetState.enabled;

  @override
  Widget build(BuildContext context) {
    /// styles helpers
    late String cwidget, state, contrast;

    cwidget = 'action-button';
    contrast = context.fetch<String>();
    state = enumToString(_state);

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _state = CWidgetState.focus),
      onTapUp: (_) => setState(() => _state = CWidgetState.enabled),
      onTapCancel: () => setState(() => _state = CWidgetState.enabled),
      child: DefaultTextStyle(
        style: TextStyle(
          color: _colors['$cwidget-$contrast-text-color'],
          fontFamily: CFonts.primaryRegular,
        ),
        child: AnimatedContainer(
          duration: _layouts['$cwidget-background-color-animation-duration'],
          curve: _layouts['$cwidget-background-color-animation-curve'],
          height: widget.height,
          width: widget.width,
          alignment: Alignment.center,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _colors['$cwidget-$state-$contrast-background-color'],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
