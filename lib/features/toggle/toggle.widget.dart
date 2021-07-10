import 'package:flutter/material.dart';
import 'package:carbon/features/icon/index.dart';
import 'package:carbon/features/outline/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'package:carbon/shared/index.dart';

import 'toggle.style.dart';

/// A toggle is used to quickly switch between two possible states.
///
/// They are commonly used for “on/off” switches.
class CToggle extends StatefulWidget implements CWidget {
  CToggle({
    Key? key,
    this.enable = true,
    this.value = true,
    this.showStatusLabel = true,
    this.labelText,
    this.size = CWidgetSize.md,
    required this.onToggle,
  }) : super(key: key);

  /// Whether the toggle is checked or not. Default is [true]
  final bool value;

  /// The `labelText` of this toggle
  final String? labelText;

  /// The `size` of this toggle. It can only be `md` or `sm`
  final CWidgetSize size;

  /// Called when the value of the toggle change.
  ///
  /// This callback passes a new value, but doesn't update its state
  /// internally.
  final void Function(bool value) onToggle;

  /// Whether the toggle should display its status (`On` | `Off`) or not
  final bool showStatusLabel;

  /// Whether the toggle is enabled or not
  final bool enable;

  @override
  _CToggleState createState() => _CToggleState();
}

class _CToggleState extends State<CToggle> {
  final _colors = CToggleStyle.colors;
  final _layouts = CToggleStyle.layouts;

  /// styles helpers
  String _cwidget = 'toggle';
  String _state = enumToString(CWidgetState.enabled);
  String _status = '';

  bool _outlined = false;
  bool _value = false;

  late Size _size;

  @override
  void initState() {
    _value = widget.value;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final widgetSize = enumToString(widget.size);

    _value = widget.value;
    _size = _layouts['toggle-$widgetSize-size'];

    super.didChangeDependencies();
  }

  bool get _enable {
    return context.inheritedEnable ? widget.enable : false;
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_enable) {
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
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: TextStyle(
              fontSize: 12,
              fontFamily: CFonts.primaryRegular,
              color: _colors['$_cwidget-$_state-label-color'],
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
              ignoring: !_enable,
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
                    alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
                    padding: const EdgeInsets.all(3),
                    duration: _layouts['$_cwidget-animation-duration'],
                    curve: _layouts['$_cwidget-animation-curve'],
                    decoration: BoxDecoration(
                      color: _colors['$_cwidget-$_state-$_status-fill-color'],
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: AnimatedContainer(
                      height: _size.height - 6,
                      width: _size.height - 6,
                      alignment: Alignment.center,
                      duration: _layouts['$_cwidget-animation-duration'],
                      curve: _layouts['$_cwidget-animation-curve'],
                      decoration: BoxDecoration(
                        color: _colors['$_cwidget-$_state-indicator-color'],
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: widget.size == CWidgetSize.sm
                          ? CSVGIcon.asset(
                              'assets/svg/toggle-checkmark.svg',
                              color: _colors['$_cwidget-$_state-$_status-checkmark-color'],
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
                  color: _colors['$_cwidget-$_state-label-color'],
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
