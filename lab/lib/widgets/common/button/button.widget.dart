import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

import 'button.style.dart';

class CButton extends StatefulWidget {
  CButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.type = CButtonType.primary,
    this.enabled = true,
    this.icon,
    this.hasIconOnly = false,
    this.fluid = false,
    this.height = 48,
    this.width = 178,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.labelSize = 14,
  }) : super(key: key);

  final CButtonType type;
  final EdgeInsetsGeometry padding;
  final double height;
  final double width;
  final bool enabled;
  final bool fluid;
  final bool hasIconOnly;
  final String label;
  final double labelSize;
  final Widget? icon;
  final void Function() onTap;

  @override
  _CButtonState createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  var _state = CWidgetState.enabled;
  var _focused = false;

  @override
  Widget build(BuildContext context) {
    const colors = cButtonColors;
    final layout = cButtonLayout;

    /// determine the [_state] of the widget.

    if (!widget.enabled) {
      _state = CWidgetState.disabled;
    } else if (widget.enabled && _focused) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    final status = enumToString(widget.type);
    final state = enumToString(_state);

    final style = 'button-$status-$state';

    return IgnorePointer(
      ignoring: !widget.enabled,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (widget.onTap != null) ? (_) => setState(() => _focused = true) : null,
        onTapUp: (widget.onTap != null) ? (_) => setState(() => _focused = false) : null,
        onTapCancel: (widget.onTap != null) ? () => setState(() => _focused = false) : null,
        child: Stack(
          children: [
            AnimatedContainer(
              height: widget.height,
              width: widget.hasIconOnly
                  ? widget.height
                  : widget.fluid
                      ? null
                      : widget.width,
              duration: layout['button-background-color-animation-duration'],
              curve: layout['button-background-color-animation-curve'],
              decoration: BoxDecoration(color: colors['$style-background-color']),
            ),
            AnimatedContainer(
              height: widget.height,
              width: widget.hasIconOnly
                  ? widget.height
                  : widget.fluid
                      ? null
                      : widget.width,
              duration: layout['button-$status-first-border-animation-duration'],
              curve: layout['button-$status-first-border-animation-curve'],
              decoration: BoxDecoration(border: layout['$style-first-border']),
            ),
            AnimatedContainer(
              height: widget.height,
              width: widget.hasIconOnly
                  ? widget.height
                  : widget.fluid
                      ? null
                      : widget.width,
              duration: layout['button-$status-second-border-animation-duration'],
              curve: layout['button-$status-second-border-animation-curve'],
              decoration: BoxDecoration(border: layout['$style-second-border']),
            ),
            SizedBox(
              height: widget.height,
              width: widget.hasIconOnly
                  ? widget.height
                  : widget.fluid
                      ? null
                      : widget.width,
              child: Padding(
                padding: widget.padding,
                child: DefaultTextStyle(
                  style: TextStyle(color: colors['$style-content-color']),
                  child: widget.hasIconOnly
                      ? widget.icon!
                      : widget.type == CButtonType.ghost
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CText(
                                  data: widget.label,
                                  style: TextStyle(fontSize: widget.labelSize),
                                ),
                                if (widget.icon != null) ...[const SizedBox(width: 8), widget.icon!],
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CText(
                                  data: widget.label,
                                  style: TextStyle(fontSize: widget.labelSize),
                                ),
                                const Expanded(child: const SizedBox()),
                                if (widget.icon != null) widget.icon!,
                              ],
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
