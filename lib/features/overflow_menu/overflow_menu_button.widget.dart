import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu.widget.dart';
import 'overflow_menu_button.props.dart';
import 'overflow_menu_button.style.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuButton extends StatefulWidget {
  COverflowMenuButton({
    Key? key,
    required Widget icon,
    required List<COverflowMenuItem> items,
    String? iconDescription,
    bool enable = true,
    bool barrierDismissible = true,
    VoidCallback? onClose,
    VoidCallback? onOpen,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.md,
  })  : props = COverflowMenuButtonProps(
          iconDescription: iconDescription,
          icon: icon,
          enable: enable,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
          child: icon,
          controller: COverflowMenuController(),
        ),
        super(key: key);

  final COverflowMenuButtonProps props;

  @override
  _COverflowMenuButtonState createState() => _COverflowMenuButtonState();
}

class _COverflowMenuButtonState extends State<COverflowMenuButton> {
  final _colors = COverflowMenuButtonStyle.colors;
  final _layouts = COverflowMenuButtonStyle.layouts;

  /// styles helpers
  String _cwidget = 'overflowmenu-button';
  String _state = enumToString(CWidgetState.enabled);
  String _size = '';

  bool _focused = false;

  bool get _isOpen => widget.props.controller.isOpen;

  void _openMenu() => widget.props.controller.open();
  void _closeMenu() => widget.props.controller.close();

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.props.controller.addListener(() {
      setState(() {
        _focused = _isOpen ? true : false;
      });
    });
  }

  @override
  void dispose() {
    widget.props.controller.dispose();
    super.dispose();
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_isEnabled()) {
      _state = enumToString(CWidgetState.disabled);

      if (_isOpen) {
        _closeMenu();
      }
    } else if (_isEnabled() && _focused) {
      _state = enumToString(CWidgetState.focus);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }

    _size = enumToString(widget.props.size);
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    final Size dimensions = _layouts['$_cwidget-$_size-dimensions'];

    return IgnorePointer(
      ignoring: !_isEnabled(),
      child: GestureDetector(
        onTap: () {
          _isOpen ? _closeMenu() : _openMenu();
        },
        onTapDown: (_) => setState(() => _focused = true),
        onTapCancel: () => setState(() => _focused = false),
        child: COverflowMenu(
          controller: widget.props.controller,
          barrierDismissible: widget.props.barrierDismissible,
          size: widget.props.size,
          onOpen: widget.props.onOpen,
          onClose: widget.props.onClose,
          menuOffset: widget.props.menuOffset,
          items: widget.props.items.map((item) {
            return COverflowMenuItem(
              key: item.key,
              child: item.child,
              enable: item.enable,
              hasDivider: item.hasDivider,
              isDelete: item.isDelete,
              onTap: () {
                item.onTap?.call();
                _closeMenu();
              },
            );
          }).toList(),
          child: AnimatedContainer(
            height: dimensions.height,
            width: dimensions.width,
            alignment: Alignment.center,
            duration: _layouts['$_cwidget-background-color-animation-duration'],
            curve: _layouts['$_cwidget-background-color-animation-curve'],
            decoration: BoxDecoration(
              color: _colors['$_cwidget-$_state-background-color'],
              boxShadow: [
                if (_isOpen)
                  BoxShadow(
                    color: CColors.black100.withOpacity(0.3),
                    blurRadius: 6,
                  ),
              ],
            ),
            child: widget.props.icon,
          ),
        ),
      ),
    );
  }
}
