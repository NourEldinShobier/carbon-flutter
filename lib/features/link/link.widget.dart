import 'package:flutter/widgets.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'link.props.dart';
import 'link.style.dart';

class CLink extends StatefulWidget {
  CLink({
    Key? key,
    bool enable = true,
    required String url,
    required void Function(String url) onTap,
    double fontSize = 14,
    String? caption,
  })  : props = CLinkProps(
          caption: caption,
          url: url,
          fontSize: fontSize,
          enable: enable,
          onTap: onTap,
        ),
        super(key: key);

  final CLinkProps props;

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
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return IgnorePointer(
      ignoring: !_isEnabled(),
      child: GestureDetector(
        onTap: () => widget.props.onTap(widget.props.url),
        child: CText(
          data: widget.props.caption ?? widget.props.url,
          style: TextStyle(
            color: _colors['$_cwidget-$_state-text-color'],
            fontSize: widget.props.fontSize,
          ),
        ),
      ),
    );
  }
}
