import 'package:flutter/widgets.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'link.style.dart';

class CLink extends StatefulWidget {
  const CLink({
    Key? key,
    this.enable = true,
    required this.url,
    required this.onTap,
    this.fontSize = 14,
    this.caption,
  }) : super(key: key);

  final String? caption;
  final String url;
  final double fontSize;
  final bool enable;
  final void Function(String url) onTap;

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

    if (!_isEnabled()) {
      _state = enumToString(CWidgetState.disabled);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }
  }

  bool _isEnabled() {
    return context.inheritedEnable ? widget.enable : false;
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return IgnorePointer(
      ignoring: !_isEnabled(),
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
