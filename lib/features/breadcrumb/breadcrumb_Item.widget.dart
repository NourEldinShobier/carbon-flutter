import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

import 'breadcrumb.style.dart';

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
  final _colors = CBreadcrumbStyle.colors;
  final _layouts = CBreadcrumbStyle.layouts;

  var _state = CWidgetState.enabled;
  var _focused = false;

  @override
  Widget build(BuildContext context) {
    var state = '', selector = '';

    /// determine the [_state] of the widget.

    if (_focused) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    state = enumToString(_state);
    selector = 'breadcrumb-item-$state';

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _focused = true),
      onTapUp: (_) => setState(() => _focused = false),
      onTapCancel: () => setState(() => _focused = false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: _colors['$selector-background-color'],
          borderRadius: BorderRadius.circular(
            _layouts['breadcrumb-item-border-radius'],
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: _layouts['breadcrumb-item-spacing'],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _layouts['breadcrumb-item-spacing'],
          vertical: _layouts['breadcrumb-item-spacing'],
        ),
        duration: _layouts['breadcrumb-animation-duration'],
        curve: _layouts['breadcrumb-animation-curve'],
        child: DefaultTextStyle(
          style: TextStyle(
            color: widget.isCurrentPage ? _colors['breadcrumb-item-current-color'] : _colors['breadcrumb-item-color'],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
