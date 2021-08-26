import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu_button.props.dart';
import 'overflow_menu_button.style.dart';

class COverflowMenuButton extends StatefulWidget {
  COverflowMenuButton({
    Key? key,
    required Widget icon,
    required List<COverflowMenuItem> items,
    String? iconDescription,
    bool enable = true,
    bool light = false,
    bool open = false,
    VoidCallback? onTap,
    VoidCallback? onClose,
    VoidCallback? onOpen,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.md,
  })  : props = COverflowMenuButtonProps(
          key: GlobalKey(),
          iconDescription: iconDescription,
          icon: icon,
          enable: enable,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
        ),
        super(key: key);

  final COverflowMenuButtonProps props;

  @override
  _COverflowMenuButtonState createState() => _COverflowMenuButtonState();
}

class _COverflowMenuButtonState extends State<COverflowMenuButton> {
  final _colors = COverflowMenuButtonStyle.colors;
  final _layouts = COverflowMenuButtonStyle.layouts;

  late COverflowMenu _menu;

  /// styles helpers
  String _cwidget = 'overflowmenu-button';
  String _state = enumToString(CWidgetState.enabled);
  String _size = '';

  bool _isOpen = false;
  bool _focused = false;

  @override
  void didChangeDependencies() {
    _menu = COverflowMenu(
      key: widget.props.key,
      size: widget.props.size,
      menuOffset: widget.props.menuOffset,
      onClose: () {
        _onClose();
        widget.props.onClose?.call();
      },
      onOpen: () {
        _onOpen();
        widget.props.onOpen?.call();
      },
      items: widget.props.items.map((item) {
        return COverflowMenuItem(
          key: item.key,
          child: item.child,
          enable: item.enable,
          hasDivider: item.hasDivider,
          isDelete: item.isDelete,
          onTap: () {
            item.onTap?.call();
            _menu.close();
          },
        );
      }).toList(),
    );

    super.didChangeDependencies();
  }

  void _onClose() {
    setState(() {
      _isOpen = false;
      _focused = false;
    });
  }

  void _onOpen() {
    setState(() {
      _isOpen = true;
      _focused = true;
    });
  }

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_isEnabled()) {
      _state = enumToString(CWidgetState.disabled);

      if (_isOpen) {
        _menu.close();
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
          _isOpen ? _menu.close() : _menu.open();
        },
        onTapDown: (_) => setState(() => _focused = true),
        onTapCancel: () => setState(() => _focused = false),
        child: AnimatedContainer(
          key: widget.props.key,
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
    );
  }
}
