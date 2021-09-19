import 'package:flutter/widgets.dart';

import 'package:carbon/shared/index.dart';
import 'package:carbon/features/icon/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'checkbox.style.dart';

class CCheckbox extends StatefulWidget {
  CCheckbox({
    Key? key,
    this.enable = true,
    required this.onChange,
    this.value = false,
    this.label,
    this.labelSize = 14,
  }) : super(key: key);

  final bool enable;
  final bool value;
  final String? label;
  final double labelSize;
  final void Function(bool value) onChange;

  @override
  _CCheckboxState createState() => _CCheckboxState();
}

class _CCheckboxState extends State<CCheckbox> {
  final _colors = CCheckboxStyle.colors;
  final _layouts = CCheckboxStyle.layouts;

  /// styles helpers
  String _cwidget = 'checkbox';
  String _state = enumToString(CWidgetState.enabled);

  bool _value = false;
  bool _focused = false;

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

  bool _isEnabled() {
    return context.inheritedEnable ? widget.enable : false;
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_isEnabled()) {
      _state = enumToString(CWidgetState.disabled);
    } else if (_isEnabled() && _focused) {
      _state = enumToString(CWidgetState.focus);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return IgnorePointer(
      ignoring: !_isEnabled(),
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
                  duration: _layouts['$_cwidget-border-color-animation-duration'],
                  curve: _layouts['$_cwidget-border-color-animation-curve'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: _colors['$_cwidget-$_state-border-color']!,
                      width: _focused ? 2 : 1,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _value ? _colors['$_cwidget-$_state-fill-color'] : CColors.transparent,
                  ),
                ),
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  duration: _layouts['$_cwidget-fill-color-animation-duration'],
                  curve: _layouts['$_cwidget-fill-color-animation-curve'],
                  child: CSVGIcon.asset(
                    'assets/svg/checkmark.svg',
                    color: _value ? _colors['$_cwidget-$_state-checkmark-color'] : CColors.transparent,
                    height: 8,
                    package: 'carbon',
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
                  color: _colors['$_cwidget-$_state-label-color'],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
