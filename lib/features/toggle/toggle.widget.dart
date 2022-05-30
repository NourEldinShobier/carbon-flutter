import 'package:flutter/widgets.dart';

import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/outline/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'package:carbon/shared/index.dart';
import 'package:flutter_svg/svg.dart';

import 'toggle.props.dart';
import 'toggle.styles.dart';

enum CToggleSize { sm, md }

enum CToggleCheckStatus { checked, unchecked }

typedef _Styles = CToggleStyles;

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
  CToggleState createState() => CToggleState();
}

class CToggleState extends State<CToggle> {
  bool _outlined = false;
  bool _value = false;

  late Size _dimensions;
  CWidgetState _state = CWidgetState.enabled;
  CToggleCheckStatus _checkStatus = CToggleCheckStatus.unchecked;

  @override
  void initState() {
    _value = widget.props.value;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _value = widget.props.value;
    _dimensions = _Styles.dimensions[widget.props.size]!;

    super.didChangeDependencies();
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _evaluateStateVariables() {
    if (!_isEnabled) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }

    _checkStatus = _value ? CToggleCheckStatus.checked : CToggleCheckStatus.unchecked;
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
              color: _Styles.labelColor[_state],
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
              ignoring: !_isEnabled,
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
                    width: _dimensions.width,
                    height: _dimensions.height,
                    alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
                    padding: const EdgeInsets.all(3),
                    duration: _Styles.animation['duration'],
                    curve: _Styles.animation['curve'],
                    decoration: BoxDecoration(
                      color: _Styles.fillColor[_state]![_checkStatus],
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: AnimatedContainer(
                      height: _dimensions.height - 6,
                      width: _dimensions.height - 6,
                      alignment: Alignment.center,
                      duration: _Styles.animation['duration'],
                      curve: _Styles.animation['curve'],
                      decoration: BoxDecoration(
                        color: _Styles.indicatorColor[_state],
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: widget.props.size == CToggleSize.sm
                          ? SvgPicture.asset(
                              'assets/svg/toggle-checkmark.svg',
                              color: _Styles.checkmarkColor[_state]![_checkStatus],
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
                  color: _Styles.labelColor[_state],
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
