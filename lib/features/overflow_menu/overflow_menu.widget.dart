import 'dart:ui';
import 'dart:core';
import 'package:carbon/shared/index.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:flutter/material.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu.style.dart';
import 'overflow_menu_item.style.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenu {
  COverflowMenu({
    required GlobalKey key, // TODO: test without global key
    required List<COverflowMenuItem> items,
    VoidCallback? onClose,
    VoidCallback? onOpen,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.md,
  }) : _props = COverflowMenuProps(
          key: key,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
        ) {
    _size = enumToString(_props.size);
  }

  final COverflowMenuProps _props;

  /// View variables

  late BuildContext _context;
  late OverlayEntry _entry;
  late Rect _parentRect;
  late Size _screenSize;
  late COverflowMenuDirection _direction;

  Offset _offset = Offset.zero;
  bool _isOpen = false;

  /// Styles variables

  final _menuLayouts = COverflowMenuStyle.layouts;
  final _menuColors = COverflowMenuStyle.colors;
  final _menuItemLayouts = COverflowMenuItemStyle.layouts;

  /// styles helpers

  String _cwidget = 'overflowmenu';
  String _size = '';

  Size get _menuItemSize {
    return _menuItemLayouts['overflowmenu-item-$_size-dimensions'];
  }

  double get _menuWidth => _menuItemSize.width;

  double get _menuHeight => _menuItemSize.height * _props.items.length;

  void open() {
    if (_isOpen) return;

    _context = _props.key.currentContext!;
    _parentRect = _getParentWidgetRect();
    _screenSize = window.physicalSize / window.devicePixelRatio;

    _offset = _calculateOffset();

    _entry = OverlayEntry(builder: (_) => _buildOverflowMenu());

    Overlay.of(_context)!.insert(_entry);
    _isOpen = true;

    _props.onOpen?.call();
  }

  void close() {
    if (!_isOpen) return;

    _entry.remove();
    _isOpen = false;

    _props.onClose?.call();
  }

  Rect _getParentWidgetRect() {
    final renderBox = _props.key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
  }

  Offset _calculateOffset() {
    double dx = _parentRect.left;
    double dy = _parentRect.top;

    // If the menu is at the right side of the screen
    if (dx + _menuWidth > _screenSize.width) {
      dx = dx + _parentRect.width - _menuWidth;
    }

    if ((dy + _menuHeight + _parentRect.height) > _screenSize.height) {
      dy -= _menuHeight;
      _direction = COverflowMenuDirection.top;
    } else {
      dy += _parentRect.height;
      _direction = COverflowMenuDirection.bottom;
    }

    if (_direction == COverflowMenuDirection.bottom) {
      dx += _props.menuOffset.dx;
      dy += _props.menuOffset.dy;
    } else {
      dx -= _props.menuOffset.dx;
      dy -= _props.menuOffset.dy;
    }

    return Offset(dx, dy);
  }

  Widget _buildOverflowMenu() {
    return Material(
      color: Colors.transparent,
      child: Provider.value(
        value: _props,
        child: GestureDetector(
          onVerticalDragStart: (_) => close(),
          onHorizontalDragStart: (_) => close(),
          child: Stack(
            children: [
              Positioned(
                left: _offset.dx,
                top: _offset.dy,
                child: Container(
                  width: _menuWidth,
                  height: _menuHeight,
                  decoration: BoxDecoration(
                    color: _menuColors['$_cwidget-background-color'],
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 6),
                        color: CColors.black100.withOpacity(0.2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _props.items,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
