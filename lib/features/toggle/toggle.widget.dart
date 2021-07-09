import 'package:flutter/material.dart';
import 'package:carbon/features/icon/index.dart';
import 'package:carbon/features/outline/index.dart';

import 'package:carbon/shared/index.dart';

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

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!widget.enable) {
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