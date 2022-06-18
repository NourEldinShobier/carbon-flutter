import 'package:flutter/widgets.dart';

import 'package:carbon/shared/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'checkbox.props.dart';
import 'checkbox.styles.dart';

typedef _Styles = CCheckboxStyles;

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
  CCheckboxState createState() => CCheckboxState();
}

class CCheckboxState extends State<CCheckbox> {
  CWidgetState _state = CWidgetState.enabled;

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

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _setStateVariables() {
    if (!_isEnabled) {
      _state = CWidgetState.disabled;
    } else if (_isEnabled && _focused) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return IgnorePointer(
      ignoring: !_isEnabled,
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
                  duration: _Styles.borderAnimation['duration'],
                  curve: _Styles.borderAnimation['curve'],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: _Styles.borderColor[_state]!,
                      width: _focused ? 2 : 1,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _value ? _Styles.backgroundColor[_state] : CColors.transparent,
                  ),
                ),
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  duration: _Styles.backgroundAnimation['duration'],
                  curve: _Styles.backgroundAnimation['curve'],
                  child: SvgPicture.asset(
                    'assets/svg/checkmark.svg',
                    color: _value ? _Styles.checkmarkColor[_state] : CColors.transparent,
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
                style: TextStyle(fontSize: 14, color: _Styles.labelColor[_state]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
