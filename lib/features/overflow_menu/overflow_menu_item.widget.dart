import 'package:carbon/features/enable/index.dart';
import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'package:pmvvm/pmvvm.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu.widget.dart';
import 'overflow_menu_item.styles.dart';

enum COverflowMenuItemKind { primary, delete }

typedef _Styles = COverflowMenuItemStyles;

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
  COverflowMenuItemState createState() => COverflowMenuItemState();
}

class COverflowMenuItemState extends State<COverflowMenuItem> with AfterInitMixin {
  late COverflowMenuProps _menuProps;
  late COverflowMenuSize _size;

  CWidgetState _state = CWidgetState.enabled;
  COverflowMenuItemKind _kind = COverflowMenuItemKind.primary;

  bool _focused = false;

  @override
  void didInitState() {
    _menuProps = context.fetch<COverflowMenuProps>();
  }

  void _setStateVariables() {
    if (!widget.props.enable) {
      _state = CWidgetState.disabled;
    } else if (widget.props.enable && _focused) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }

    if (widget.props.isDelete) {
      _kind = COverflowMenuItemKind.delete;
    } else {
      _kind = COverflowMenuItemKind.primary;
    }

    _size = _menuProps.size;
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

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
            curve: _Styles.animation['curve'],
            duration: _Styles.animation['duration'],
            height: _Styles.dimensions[_size]!.height,
            width: _Styles.dimensions[_size]!.width,
            alignment: Alignment.centerLeft,
            padding: _Styles.padding[_size],
            decoration: BoxDecoration(
              color: _Styles.backgroundColor[_kind]![_state],
              border: Border(
                bottom: widget.props.hasDivider ? BorderSide(color: _Styles.dividerColor) : BorderSide.none,
              ),
            ),
            child: widget.props.child,
          ),
        ),
      ),
    );
  }
}
