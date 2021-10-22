import 'package:flutter/widgets.dart';

import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/icon/index.dart';
import 'package:carbon/features/outline/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'package:carbon/shared/index.dart';

import 'toggle.enum.dart';
import 'toggle.props.dart';
import 'toggle.style.dart';

/// A toggle is used to quickly switch between two possible states.
///
/// They are commonly used for “on/off” switches.
class CToggle extends StatefulWidget {
  CToggle({
    Key? key,
    required void Function(bool value) onToggle,
    bool enable = true,
    bool value = true,
    bool showStatusLabel = true,
    String? labelText,
    CToggleSize size = CToggleSize.md,
  })  : props = CToggleProps(
          onToggle: onToggle,
          enable: enable,
          value: value,
          labelText: labelText,
          size: size,
          showStatusLabel: showStatusLabel,
        ),
        super(key: key);

  final CToggleProps props;

  @override
  _CToggleState createState() => _CToggleState();
}

class _CToggleState extends State<CToggle> {
  final _styles = CToggleStyle.styles;

  /// styles helpers
  String _state = enumToString(CWidgetState.enabled);
  String _status = '';

  bool _outlined = false;
  bool _value = false;

  late Size _size;

  @override
  void initState() {
    _value = widget.props.value;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final widgetSize = enumToString(widget.props.size);

    _value = widget.props.value;
    _size = _styles['toggle-$widgetSize-size'];

    super.didChangeDependencies();
  }

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_isEnabled()) {
      _state = enumToString(CWidgetState.disabled);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }

    _status = _value ? 'checked' : 'unchecked';
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.props.labelText != null) ...[
          CText(
            data: widget.props.labelText!,
            style: TextStyle(
              fontSize: 12,
              fontFamily: CFonts.primaryRegular,
              color: _styles['toggle-$_state-label-color'],
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
              ignoring: !_isEnabled(),
              child: GestureDetector(
                onTapUp: (_) => setState(() {
                  _value = !_value;
                  _outlined = !_outlined;

                  Future.delayed(
                    const Duration(milliseconds: 750),
                    () => setState(() => _outlined = !_outlined),
                  );

                  widget.props.onToggle(_value);
                }),
                child: COutline(
                  animationDuration: 400,
                  borderRadius: BorderRadius.circular(1000),
                  outlineWidth: 2,
                  outlined: _outlined,
                  child: AnimatedContainer(
                    width: _size.width,
                    height: _size.height,
                    alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
                    padding: const EdgeInsets.all(3),
                    duration: _styles['toggle-animation-duration'],
                    curve: _styles['toggle-animation-curve'],
                    decoration: BoxDecoration(
                      color: _styles['toggle-$_state-$_status-fill-color'],
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: AnimatedContainer(
                      height: _size.height - 6,
                      width: _size.height - 6,
                      alignment: Alignment.center,
                      duration: _styles['toggle-animation-duration'],
                      curve: _styles['toggle-animation-curve'],
                      decoration: BoxDecoration(
                        color: _styles['toggle-$_state-indicator-color'],
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: widget.props.size == CToggleSize.sm
                          ? CSVGIcon.asset(
                              'assets/svg/toggle-checkmark.svg',
                              color: _styles['toggle-$_state-$_status-checkmark-color'],
                              package: 'carbon',
                              width: 6,
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.props.showStatusLabel) ...[
              const SizedBox(width: 8),
              CText(
                data: _value ? 'On' : 'Off',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: CFonts.primaryRegular,
                  color: _styles['toggle-$_state-label-color'],
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
