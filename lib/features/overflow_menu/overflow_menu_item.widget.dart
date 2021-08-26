import 'package:carbon/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:carbon/features/enable/index.dart';

import 'package:pmvvm/pmvvm.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu_item.style.dart';

class COverflowMenuItem extends StatefulWidget {
  const COverflowMenuItem({
    Key? key,
    required this.child,
    this.onTap,
    this.enable = true,
    this.hasDivider = false,
    this.isDelete = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;

  final bool enable;
  final bool hasDivider;
  final bool isDelete;

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

    if (!widget.enable) {
      _state = enumToString(CWidgetState.disabled);
    } else if (widget.enable && _focused) {
      _state = enumToString(CWidgetState.focus);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }

    _kind = widget.isDelete ? 'delete' : 'primary';
    _size = enumToString(_menuProps.size);
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    final Size dimensions = _layouts['$_cwidget-$_size-dimensions'];

    return CEnable(
      value: widget.enable,
      inheritFromParent: false,
      child: IgnorePointer(
        ignoring: !widget.enable,
        child: GestureDetector(
          onTap: () => widget.onTap?.call(),
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
                bottom: widget.hasDivider ? BorderSide(color: _colors['$_cwidget-divider-color']!) : BorderSide.none,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
