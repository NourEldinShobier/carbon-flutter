import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

import 'breadcrumb.props.dart';
import 'breadcrumb_item.styles.dart';

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
  /// styles helpers
  CWidgetState _state = CWidgetState.enabled;

  bool _focused = false;

  void _evaluateStateVariables() {
    if (_focused) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
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
          color: CBreadcrumbItemStyles.backgroundColor[_state],
          borderRadius: BorderRadius.circular(CBreadcrumbItemStyles.borderRadius),
        ),
        margin: EdgeInsets.symmetric(horizontal: CBreadcrumbItemStyles.itemSpacing),
        padding: EdgeInsets.symmetric(
          horizontal: CBreadcrumbItemStyles.itemSpacing,
          vertical: CBreadcrumbItemStyles.itemSpacing,
        ),
        duration: CBreadcrumbItemStyles.animation['duration'],
        curve: CBreadcrumbItemStyles.animation['curve'],
        child: DefaultTextStyle(
          style: TextStyle(
            color: CBreadcrumbItemStyles.textColor[widget.props.isCurrentPage],
          ),
          child: widget.props.child,
        ),
      ),
    );
  }
}
