import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

import 'breadcrumb_item.style.dart';

class CBreadcrumbItem extends StatefulWidget {
  CBreadcrumbItem({
    Key? key,
    required this.child,
    required this.onTap,
    this.isCurrentPage = false,
  }) : super(key: key);

  final Widget child;

  /// Provide if this breadcrumb item represents the current page
  final bool isCurrentPage;

  /// Is invoded when [CBreadcrumbItem] is pressed
  final VoidCallback onTap;

  @override
  _CBreadcrumbItemState createState() => _CBreadcrumbItemState();
}

class _CBreadcrumbItemState extends State<CBreadcrumbItem> {
  final _colors = CBreadcrumbItemStyle.colors;
  final _layouts = CBreadcrumbItemStyle.layouts;

  /// styles helpers
  String _cwidget = 'breadcrumb-item';
  String _state = enumToString(CWidgetState.enabled);

  bool _focused = false;

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (_focused) {
      _state = enumToString(CWidgetState.focus);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _focused = true),
      onTapUp: (_) => setState(() => _focused = false),
      onTapCancel: () => setState(() => _focused = false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: _colors['$_cwidget-$_state-background-color'],
          borderRadius: BorderRadius.circular(
            _layouts['$_cwidget-border-radius'],
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: _layouts['$_cwidget-spacing'],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _layouts['$_cwidget-spacing'],
          vertical: _layouts['$_cwidget-spacing'],
        ),
        duration: _layouts['$_cwidget-animation-duration'],
        curve: _layouts['$_cwidget-animation-curve'],
        child: DefaultTextStyle(
          style: TextStyle(
            color: widget.isCurrentPage ? _colors['$_cwidget-current-color'] : _colors['$_cwidget-color'],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
