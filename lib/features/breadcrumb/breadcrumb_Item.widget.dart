import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

import 'breadcrumb.props.dart';
import 'breadcrumb_item.style.dart';

/// A ghost button with a short and clear text that reflects a
/// location or an entity it links to.
class CBreadcrumbItem extends StatefulWidget {
  CBreadcrumbItem({
    Key? key,
    required Widget child,
    required VoidCallback onTap,
    bool isCurrentPage = false,
  })  : props = CBreadcrumbItemProps(
          child: child,
          isCurrentPage: isCurrentPage,
          onTap: onTap,
        ),
        super(key: key);

  final CBreadcrumbItemProps props;

  @override
  _CBreadcrumbItemState createState() => _CBreadcrumbItemState();
}

class _CBreadcrumbItemState extends State<CBreadcrumbItem> {
  final _styles = CBreadcrumbItemStyle.styles;

  /// styles helpers
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
      onTap: widget.props.onTap,
      onTapDown: (_) => setState(() => _focused = true),
      onTapUp: (_) => setState(() => _focused = false),
      onTapCancel: () => setState(() => _focused = false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: _styles['breadcrumb-item-$_state-background-color'],
          borderRadius: BorderRadius.circular(
            _styles['breadcrumb-item-border-radius'],
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: _styles['breadcrumb-item-spacing'],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _styles['breadcrumb-item-spacing'],
          vertical: _styles['breadcrumb-item-spacing'],
        ),
        duration: _styles['breadcrumb-item-animation-duration'],
        curve: _styles['breadcrumb-item-animation-curve'],
        child: DefaultTextStyle(
          style: TextStyle(
            color: widget.props.isCurrentPage ? _styles['breadcrumb-item-current-color'] : _styles['breadcrumb-item-color'],
          ),
          child: widget.props.child,
        ),
      ),
    );
  }
}
