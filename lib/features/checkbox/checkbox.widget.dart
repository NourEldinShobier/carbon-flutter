import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/icon/index.dart';
import 'package:carbon/features/text/index.dart';

import 'checkbox.style.dart';

class CCheckbox extends StatefulWidget implements CWidget {
  final bool _enable;

  CCheckbox({
    Key? key,
    bool enable = true,
    required this.onChange,
    this.value = false,
    this.label,
    this.labelSize = 14,
  })  : _enable = enable,
        super(key: key);

  final bool value;
  final String? label;
  final double labelSize;
  final void Function(bool value) onChange;

  @override
  bool get enable => _enable;

  @override
  _CCheckboxState createState() => _CCheckboxState();
}

class _CCheckboxState extends State<CCheckbox> {
  final colors = CCheckboxStyle.colors;
  final layouts = CCheckboxStyle.layouts;

  /// styles helpers
  late String state, selector;

  var _state = CWidgetState.enabled;
  var _value = false;
  var _focused = false;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _value = widget.value;
    super.didChangeDependencies();
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!widget.enable) {
      _state = CWidgetState.disabled;
    } else if (widget.enable && _focused) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    state = enumToString(_state);
    selector = 'checkbox-$state';
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return IgnorePointer(
      ignoring: !widget.enable,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _focused = true),
        onTapUp: (_) => setState(() {
          _focused = false;
          _value = !_value;
          widget.onChange(_value);
        }),
        onTapCancel: () => setState(() => _focused = false),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  duration: layouts['checkbox-border-color-animation-duration'],
                  curve: layouts['checkbox-border-color-animation-curve'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: colors['$selector-border-color']!,
                      width: _focused ? 2 : 1,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _value ? colors['$selector-fill-color'] : Colors.transparent,
                  ),
                ),
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  duration: layouts['checkbox-fill-color-animation-duration'],
                  curve: layouts['checkbox-fill-color-animation-curve'],
                  child: CSVGIcon.asset(
                    'assets/svg/checkmark.svg',
                    color: _value ? colors['$selector-checkmark-color'] : Colors.transparent,
                    height: 8,
                  ),
                ),
              ],
            ),
            if (widget.label != null) ...[
              const SizedBox(width: 10),
              CText(
                data: widget.label,
                style: TextStyle(
                  fontSize: widget.labelSize,
                  color: colors['$selector-label-color'],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
