import 'package:flutter/material.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/shared/index.dart';

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
  final _colors = CLinkStyle.colors;

  /// styles helpers
  String _cwidget = 'link';
  String _state = enumToString(CWidgetState.enabled);

  void _evaluateStateVariables() {
    // determine the [_state] of the widget.

    if (!widget.enable) {
      _state = enumToString(CWidgetState.disabled);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return IgnorePointer(
      ignoring: !widget.enable,
      child: GestureDetector(
        onTap: () => widget.onTap(widget.url),
        child: CText(
          data: widget.caption ?? widget.url,
          style: TextStyle(
            color: _colors['$_cwidget-$_state-text-color'],
            fontSize: widget.fontSize,
          ),
        ),
      ),
    );
  }
}
