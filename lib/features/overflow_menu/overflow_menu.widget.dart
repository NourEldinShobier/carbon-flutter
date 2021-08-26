import 'dart:ui';
import 'dart:core';
import 'package:carbon/shared/index.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:flutter/material.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu.style.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenu {
  COverflowMenu({
    required GlobalKey key,
    required List<COverflowMenuItem> items,
    VoidCallback? onClose,
    VoidCallback? onOpen,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.md,
  }) : props = COverflowMenuProps(
          key: key,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
        ) {
    _size = enumToString(props.size);
  }

  final COverflowMenuProps props;

  /// View variables

  late BuildContext _context;
  late OverlayEntry _entry;
  late Rect _parentRect;
  late Size _screenSize;
  late COverflowMenuDirection _direction;

  Offset _offset = Offset.zero;
  bool _isOpen = false;

  /// Styles variables

  final _colors = COverflowMenuStyle.colors;
  final _layouts = COverflowMenuStyle.layouts;

  /// styles helpers

  String _cwidget = 'overflowmenu';
  String _size = '';

  Size get _menuItemDimensions => _layouts['$_cwidget-item-$_size-dimensions'];

  double get _menuWidth => _menuItemDimensions.width;

  double get _menuHeight => _menuItemDimensions.height * props.items.length;

  bool get _isBottom => _direction == COverflowMenuDirection.bottom;

  void open() {
    if (_isOpen) return;

    _context = props.key.currentContext!;
    _parentRect = _getParentWidgetRect();
    _screenSize = window.physicalSize / window.devicePixelRatio;

    _offset = _calculateOffset();

    _entry = OverlayEntry(builder: (_) => _buildOverflowMenu());

    Overlay.of(_context)!.insert(_entry);
    _isOpen = true;

    props.onOpen?.call();
  }

  void close() {
    if (!_isOpen) return;

    _entry.remove();
    _isOpen = false;

    props.onClose?.call();
  }

  Rect _getParentWidgetRect() {
    final renderBox = props.key.currentContext!.findRenderObject() as RenderBox;
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
      dx += props.menuOffset.dx;
      dy += props.menuOffset.dy;
    } else {
      dx -= props.menuOffset.dx;
      dy -= props.menuOffset.dy;
    }

    return Offset(dx, dy);
  }

  Widget _buildOverflowMenu() {
    return Provider.value(
      value: props,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onVerticalDragStart: (_) => close(),
              onHorizontalDragStart: (_) => close(),
              onTap: () => close(),
            ),
          ),
          Positioned(
            left: _offset.dx,
            top: _offset.dy,
            child: Material(
              color: CColors.transparent,
              child: Container(
                width: _menuWidth,
                height: _menuHeight,
                decoration: BoxDecoration(
                  color: _colors['$_cwidget-background-color'],
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, _isBottom ? 6 : -6),
                      color: CColors.black100.withOpacity(0.3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: props.items,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
