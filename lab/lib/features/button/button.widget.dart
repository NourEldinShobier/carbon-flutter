import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

import 'button.enum.dart';
import 'button.style.dart';

class CButton extends StatefulWidget implements CWidget {
  final _enable;

  CButton({
    Key? key,
    bool enable = true,
    required this.label,
    required this.onTap,
    this.type = CButtonType.primary,
    this.icon,
    this.hasIconOnly = false,
    this.fluid = false,
    this.height = 48,
    this.width = 178,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.labelSize = 14,
  })  : _enable = enable,
        super(key: key);

  final CButtonType type;
  final EdgeInsetsGeometry padding;
  final double height;
  final double width;
  final bool fluid;
  final bool hasIconOnly;
  final String label;
  final double labelSize;
  final Widget? icon;
  final void Function() onTap;

  @override
  bool get enable => _enable;

  @override
  _CButtonState createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  var _state = CWidgetState.enabled;
  var _focused = false;

  double? calculateWidth() {
    if (widget.hasIconOnly) {
      return widget.height;
    }

    return widget.fluid ? null : widget.width;
  }

  @override
  Widget build(BuildContext context) {
    const colors = cButtonColors;
    final layout = cButtonLayout;

    final width = calculateWidth();

    var cwidget = '', type = '', state = '', selector = '';

    /// determine the [_state] of the widget.

    if (!widget.enable) {
      _state = CWidgetState.disabled;
    } else if (widget.enable && _focused) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    cwidget = 'button';
    type = enumToString(widget.type);
    state = enumToString(_state);

    selector = '$cwidget-$type-$state';

    return IgnorePointer(
      ignoring: !widget.enable,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _focused = true),
        onTapUp: (_) => setState(() => _focused = false),
        onTapCancel: () => setState(() => _focused = false),
        child: Stack(
          children: [
            AnimatedContainer(
              width: width,
              height: widget.height,
              duration: layout['button-background-color-animation-duration'],
              curve: layout['button-background-color-animation-curve'],
              decoration:
                  BoxDecoration(color: colors['$selector-background-color']),
            ),
            AnimatedContainer(
              width: width,
              height: widget.height,
              duration: layout['button-$type-first-border-animation-duration'],
              curve: layout['button-$type-first-border-animation-curve'],
              decoration:
                  BoxDecoration(border: layout['$selector-first-border']),
            ),
            AnimatedContainer(
              width: width,
              height: widget.height,
              duration: layout['button-$type-second-border-animation-duration'],
              curve: layout['button-$type-second-border-animation-curve'],
              decoration:
                  BoxDecoration(border: layout['$selector-second-border']),
            ),
            SizedBox(
              width: width,
              height: widget.height,
              child: Padding(
                padding: widget.padding,
                child: (() {
                  if (widget.hasIconOnly) return widget.icon;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CText(
                        data: widget.label,
                        style: TextStyle(
                          fontSize: widget.labelSize,
                          color: colors['$selector-content-color'],
                        ),
                      ),
                      if (widget.icon != null &&
                          widget.type == CButtonType.ghost) ...[
                        const SizedBox(width: 8),
                        widget.icon!
                      ] else if (widget.icon != null) ...[
                        const Expanded(child: const SizedBox()),
                        widget.icon!
                      ],
                    ],
                  );
                }()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
