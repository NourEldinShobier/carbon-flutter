import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';

import 'breadcrumbitem.props.dart';
import 'breadcrumbitem.styles.dart';

typedef _Styles = CBreadcrumbItemStyles;

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
  CBreadcrumbItemState createState() => CBreadcrumbItemState();
}

class CBreadcrumbItemState extends State<CBreadcrumbItem> {
  CWidgetState _state = CWidgetState.enabled;

  bool _focused = false;

  void _setStateVariables() {
    if (_focused) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return GestureDetector(
      onTap: widget.props.onTap,
      onTapDown: (_) => setState(() => _focused = true),
      onTapUp: (_) => setState(() => _focused = false),
      onTapCancel: () => setState(() => _focused = false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: _Styles.backgroundColor[_state],
          borderRadius: BorderRadius.circular(_Styles.borderRadius),
        ),
        margin: EdgeInsets.symmetric(horizontal: _Styles.itemSpacing),
        padding: EdgeInsets.symmetric(
          horizontal: _Styles.itemSpacing,
          vertical: _Styles.itemSpacing,
        ),
        duration: _Styles.animation['duration'],
        curve: _Styles.animation['curve'],
        child: DefaultTextStyle(
          style: TextStyle(
            color: _Styles.textColor[widget.props.isCurrentPage],
          ),
          child: widget.props.child,
        ),
      ),
    );
  }
}
