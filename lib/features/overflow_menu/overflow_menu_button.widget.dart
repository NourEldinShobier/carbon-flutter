import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu.widget.dart';
import 'overflow_menu_button.style.dart';
import 'overflow_menu_item.widget.dart';

/// A ghost button to display/hide an overflow menu when pressed.
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
  })  : assert(items.isNotEmpty),
        props = COverflowMenuButtonProps(
          iconDescription: iconDescription,
          icon: icon,
          enable: enable,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
        ),
        super(key: key);

  final COverflowMenuButtonProps props;

  @override
  _COverflowMenuButtonState createState() => _COverflowMenuButtonState();
}

class _COverflowMenuButtonState extends State<COverflowMenuButton> {
  final _styles = COverflowMenuButtonStyle.styles;

  final _controller = COverflowMenuController();

  /// styles helpers
  String _state = enumToString(CWidgetState.enabled);
  String _size = '';

  bool _focused = false;

  bool get _isOpen => _controller.isOpen;

  void _openMenu() => _controller.open();
  void _closeMenu() => _controller.close();

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _focused = _isOpen ? true : false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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

    final Size dimensions = _styles['overflowmenu-button-$_size-dimensions'];

    return IgnorePointer(
      ignoring: !_isEnabled(),
      child: GestureDetector(
        onTap: () {
          _isOpen ? _closeMenu() : _openMenu();
        },
        onTapDown: (_) => setState(() => _focused = true),
        onTapCancel: () => setState(() => _focused = false),
        child: COverflowMenu(
          controller: _controller,
          barrierDismissible: widget.props.barrierDismissible,
          size: widget.props.size,
          onOpen: widget.props.onOpen,
          onClose: widget.props.onClose,
          menuOffset: widget.props.menuOffset,
          items: widget.props.items.map((item) {
            return COverflowMenuItem(
              key: item.key,
              child: item.props.child,
              enable: item.props.enable,
              hasDivider: item.props.hasDivider,
              isDelete: item.props.isDelete,
              onTap: () {
                item.props.onTap?.call();
                _closeMenu();
              },
            );
          }).toList(),
          child: AnimatedContainer(
            height: dimensions.height,
            width: dimensions.width,
            alignment: Alignment.center,
            duration: _styles['overflowmenu-button-background-color-animation-duration'],
            curve: _styles['overflowmenu-button-background-color-animation-curve'],
            decoration: BoxDecoration(
              color: _styles['overflowmenu-button-$_state-background-color'],
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
