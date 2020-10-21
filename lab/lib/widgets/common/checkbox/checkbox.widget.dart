import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab/carbon.dart';
import 'package:stylex/stylex.dart';

export './checkbox.style.dart';

class CCheckbox extends StatefulWidget {
  CCheckbox({
    Key key,
    @required this.onChange,
    this.enabled = true,
    this.value = false,
    this.caption,
    this.captionSize = 14,
  }) : super(key: key);

  final bool enabled;
  final bool value;
  final String caption;
  final double captionSize;
  final void Function(bool value) onChange;

  @override
  _CCheckboxState createState() => _CCheckboxState();
}

class _CCheckboxState extends State<CCheckbox> {
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

  @override
  Widget build(BuildContext context) {
    final carbon = context.style;

    /// determine the [_state] of the widget.

    if (!widget.enabled) {
      _state = CWidgetState.disabled;
    } else if (widget.enabled && _focused) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    final state = enumToString(_state);
    final style = 'checkbox-$state';

    return IgnorePointer(
      ignoring: !widget.enabled,
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
                  duration:
                      carbon.get('checkbox-border-color-animation-duration'),
                  curve: carbon.get('checkbox-border-color-animation-curve'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: carbon.get('$style-border-color'),
                      width: _focused ? 2 : 1,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _value
                        ? carbon.get('$style-fill-color')
                        : Colors.transparent,
                  ),
                ),
                AnimatedContainer(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  duration:
                      carbon.get('checkbox-fill-color-animation-duration'),
                  curve: carbon.get('checkbox-fill-color-animation-curve'),
                  child: SvgPicture.asset(
                    'assets/svg/checkmark.svg',
                    color: _value
                        ? carbon.get('$style-checkmark-color')
                        : Colors.transparent,
                    height: 8,
                  ),
                ),
              ],
            ),
            if (widget.caption != null) ...[
              const SizedBox(width: 10),
              CText(
                data: widget.caption,
                style: TextStyle(fontSize: widget.captionSize),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
