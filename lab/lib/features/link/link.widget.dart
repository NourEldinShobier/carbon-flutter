import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';

import 'link.style.dart';

class CLink extends StatefulWidget implements CWidget {
  final bool _enable;

  const CLink({
    Key? key,
    bool enable = true,
    required this.url,
    required this.onTap,
    this.fontSize = 14,
    this.caption,
  })  : _enable = enable,
        super(key: key);

  final String? caption;
  final String url;
  final double fontSize;
  final void Function(String url) onTap;

  @override
  bool get enable => _enable;

  @override
  _CLinkState createState() => _CLinkState();
}

class _CLinkState extends State<CLink> {
  @override
  Widget build(BuildContext context) {
    const colors = cLinkColors;

    var _state = CWidgetState.enabled;
    var cwidget = '', state = '', selector = '';

    // determine the [_state] of the widget.

    if (!widget.enable) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }

    cwidget = 'link';
    state = enumToString(_state);

    selector = '$cwidget-$state';

    return IgnorePointer(
      ignoring: !widget.enable,
      child: GestureDetector(
        onTap: () => widget.onTap(widget.url),
        child: CText(
          data: widget.caption ?? widget.url,
          style: TextStyle(
            color: colors['$selector-text-color'],
            fontSize: widget.fontSize,
          ),
        ),
      ),
    );
  }
}
