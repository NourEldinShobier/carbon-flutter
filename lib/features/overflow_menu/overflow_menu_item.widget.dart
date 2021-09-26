import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'package:carbon/features/enable/index.dart';

import 'package:pmvvm/pmvvm.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu_item.style.dart';

/// An item in an overflow menu.
class COverflowMenuItem extends StatefulWidget {
  COverflowMenuItem({
    Key? key,
    required Widget child,
    VoidCallback? onTap,
    bool enable = true,
    bool hasDivider = false,
    bool isDelete = false,
  })  : props = COverflowMenuItemProps(
          child: child,
          onTap: onTap,
          enable: enable,
          hasDivider: hasDivider,
          isDelete: isDelete,
        ),
        super(key: key);

  final COverflowMenuItemProps props;

  @override
  _COverflowMenuItemState createState() => _COverflowMenuItemState();
}

class _COverflowMenuItemState extends State<COverflowMenuItem> with AfterInitMixin {
  final _layouts = COverflowMenuItemStyle.layouts;
  final _colors = COverflowMenuItemStyle.colors;

  late COverflowMenuProps _menuProps;

  /// Styles helpers

  String _cwidget = 'overflowmenu-item';
  String _state = enumToString(CWidgetState.enabled);
  String _kind = '';
  String _size = '';

  bool _focused = false;

  @override
  void didInitState() {
    _menuProps = context.fetch<COverflowMenuProps>();
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!widget.props.enable) {
      _state = enumToString(CWidgetState.disabled);
    } else if (widget.props.enable && _focused) {
      _state = enumToString(CWidgetState.focus);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }

    _kind = widget.props.isDelete ? 'delete' : 'primary';
    _size = enumToString(_menuProps.size);
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    final Size dimensions = _layouts['$_cwidget-$_size-dimensions'];

    return CEnable(
      value: widget.props.enable,
      inheritFromParent: false,
      child: IgnorePointer(
        ignoring: !widget.props.enable,
        child: GestureDetector(
          onTap: () => widget.props.onTap?.call(),
          onTapDown: (_) => setState(() => _focused = true),
          onTapUp: (_) => setState(() => _focused = false),
          onTapCancel: () => setState(() => _focused = false),
          child: AnimatedContainer(
            curve: _layouts['$_cwidget-animation-curve'],
            duration: _layouts['$_cwidget-animation-duration'],
            height: dimensions.height,
            width: dimensions.width,
            alignment: Alignment.centerLeft,
            padding: _layouts['$_cwidget-$_size-padding'],
            decoration: BoxDecoration(
              color: _colors['$_cwidget-$_kind-$_state-background-color'],
              border: Border(
                bottom: widget.props.hasDivider ? BorderSide(color: _colors['$_cwidget-divider-color']!) : BorderSide.none,
              ),
            ),
            child: widget.props.child,
          ),
        ),
      ),
    );
  }
}
