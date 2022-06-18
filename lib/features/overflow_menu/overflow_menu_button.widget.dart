import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'overflow_menu.props.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu.widget.dart';
import 'overflow_menu_button.styles.dart';
import 'overflow_menu_item.widget.dart';

typedef _Styles = COverflowMenuButtonStyles;

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
  COverflowMenuButtonState createState() => COverflowMenuButtonState();
}

class COverflowMenuButtonState extends State<COverflowMenuButton> {
  late COverflowMenuSize _size;

  final _controller = COverflowMenuController();

  CWidgetState _state = CWidgetState.enabled;

  bool _focused = false;

  bool get _isOpen => _controller.isOpen;

  void _openMenu() => _controller.open();
  void _closeMenu() => _controller.close();

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _focused = _isOpen ? true : false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setStateVariables() {
    if (!_isEnabled) {
      _state = CWidgetState.disabled;

      if (_isOpen) {
        _closeMenu();
      }
    } else if (_isEnabled && _focused) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }

    _size = widget.props.size;
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return IgnorePointer(
      ignoring: !_isEnabled,
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
              enable: item.props.enable,
              hasDivider: item.props.hasDivider,
              isDelete: item.props.isDelete,
              onTap: () {
                item.props.onTap?.call();
                _closeMenu();
              },
              child: item.props.child,
            );
          }).toList(),
          child: AnimatedContainer(
            height: _Styles.dimensions[_size]!.height,
            width: _Styles.dimensions[_size]!.width,
            alignment: Alignment.center,
            duration: _Styles.animation['duration'],
            curve: _Styles.animation['curve'],
            decoration: BoxDecoration(
              color: _Styles.backgroundColor[_state],
              boxShadow: [
                if (_isOpen) BoxShadow(color: CColors.black100.withOpacity(0.3), blurRadius: 6),
              ],
            ),
            child: widget.props.icon,
          ),
        ),
      ),
    );
  }
}
