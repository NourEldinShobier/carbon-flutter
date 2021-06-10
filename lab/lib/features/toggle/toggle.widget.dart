import 'package:flutter/material.dart';
import 'package:lab/features/icon/index.dart';
import 'package:lab/features/outline/index.dart';

import 'package:lab/shared/index.dart';

import 'toggle.style.dart';

class CToggle extends StatefulWidget implements CWidget {
  CToggle({
    Key? key,
    bool enable = true,
    this.value = true,
    this.showStatusLabel = true,
    this.labelText,
    this.size = CWidgetSize.md,
    required this.onToggle,
  })  : _enable = enable,
        super(key: key);

  /// Initial toggle value
  final bool value;

  /// Toggle label
  final String? labelText;

  /// Set toggle size: md | sm
  final CWidgetSize size;

  /// A callback when toggle value change
  final void Function(bool value) onToggle;

  /// [true] if you want to display toggle status: On | Off
  final bool showStatusLabel;

  final bool _enable;

  @override
  bool get enable => _enable;

  @override
  _CToggleState createState() => _CToggleState();
}

class _CToggleState extends State<CToggle> {
  final colors = CToggleStyle.colors;
  final layouts = CToggleStyle.layouts;

  /// styles helpers
  late String state, status, selector;

  late Size _size;

  var _outlined = false;
  var _state = CWidgetState.enabled;
  var _value = false;

  @override
  void initState() {
    _value = widget.value;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final widgetSize = enumToString(widget.size);

    _value = widget.value;
    _size = layouts['toggle-$widgetSize-size'];

    super.didChangeDependencies();
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!widget.enable) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }

    status = _value ? 'checked' : 'unchecked';
    state = enumToString(_state);
    selector = 'toggle-$state';
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: TextStyle(
              fontSize: 12,
              fontFamily: CFonts.primaryRegular,
              color: colors['$selector-label-color'],
            ),
          ),
          const SizedBox(height: 16),
        ],
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IgnorePointer(
              ignoring: !widget.enable,
              child: GestureDetector(
                onTapUp: (_) => setState(() {
                  _value = !_value;
                  _outlined = !_outlined;

                  Future.delayed(
                    const Duration(milliseconds: 750),
                    () => setState(() => _outlined = !_outlined),
                  );

                  widget.onToggle(_value);
                }),
                child: COutlineWidget(
                  animationDuration: 400,
                  borderRadius: BorderRadius.circular(1000),
                  outlineWidth: 2,
                  outlined: _outlined,
                  child: AnimatedContainer(
                    width: _size.width,
                    height: _size.height,
                    alignment:
                        _value ? Alignment.centerRight : Alignment.centerLeft,
                    padding: const EdgeInsets.all(3),
                    duration: layouts['toggle-animation-duration'],
                    curve: layouts['toggle-animation-curve'],
                    decoration: BoxDecoration(
                      color: colors['$selector-$status-fill-color'],
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: AnimatedContainer(
                      height: _size.height - 6,
                      width: _size.height - 6,
                      alignment: Alignment.center,
                      duration: layouts['toggle-animation-duration'],
                      curve: layouts['toggle-animation-curve'],
                      decoration: BoxDecoration(
                        color: colors['$selector-indicator-color'],
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: widget.size == CWidgetSize.sm
                          ? CSVGIcon.asset(
                              'assets/svg/toggle-checkmark.svg',
                              color:
                                  colors['$selector-$status-checkmark-color'],
                              width: 6,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.showStatusLabel) ...[
              const SizedBox(width: 8),
              Text(
                _value ? 'On' : 'Off',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: CFonts.primaryRegular,
                  color: colors['$selector-label-color'],
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
