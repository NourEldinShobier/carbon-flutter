import 'package:flutter/widgets.dart';

import 'package:carbon/shared/index.dart';
import 'package:carbon/features/icon/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'checkbox.props.dart';
import 'checkbox.style.dart';

/// Checkboxes are used when there are multiple items to select
/// in a list. Users can select zero, one, or any number of items.
class CCheckbox extends StatefulWidget {
  CCheckbox({
    Key? key,
    required void Function(bool value) onChange,
    bool enable = true,
    bool value = false,
    String? label,
  })  : props = CCheckboxProps(
          enable: enable,
          value: value,
          label: label,
          onChange: onChange,
        ),
        super(key: key);

  final CCheckboxProps props;

  @override
  _CCheckboxState createState() => _CCheckboxState();
}

class _CCheckboxState extends State<CCheckbox> {
  final _styles = CCheckboxStyle.styles;

  /// styles helpers
  String _state = enumToString(CWidgetState.enabled);

  bool _value = false;
  bool _focused = false;

  @override
  void initState() {
    _value = widget.props.value;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _value = widget.props.value;
    super.didChangeDependencies();
  }

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
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
          widget.props.onChange(_value);
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
                  duration: _styles['checkbox-border-color-animation-duration'],
                  curve: _styles['checkbox-border-color-animation-curve'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: _styles['checkbox-$_state-border-color']!,
                      width: _focused ? 2 : 1,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _value ? _styles['checkbox-$_state-fill-color'] : CColors.transparent,
                  ),
                ),
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  duration: _styles['checkbox-fill-color-animation-duration'],
                  curve: _styles['checkbox-fill-color-animation-curve'],
                  child: CSVGIcon.asset(
                    'assets/svg/checkmark.svg',
                    color: _value ? _styles['checkbox-$_state-checkmark-color'] : CColors.transparent,
                    height: 8,
                    package: 'carbon',
                  ),
                ),
              ],
            ),
            if (widget.props.label != null) ...[
              const SizedBox(width: 10),
              CText(
                data: widget.props.label!,
                style: TextStyle(
                  fontSize: 14,
                  color: _styles['checkbox-$_state-label-color'],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
