import 'dart:ui';
import 'dart:core';
import 'package:pmvvm/pmvvm.dart';
import 'package:carbon/shared/index.dart';
import 'package:flutter/material.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu.style.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenu extends StatefulWidget {
  COverflowMenu({
    Key? key,
    required COverflowMenuController controller,
    required List<COverflowMenuItem> items,
    required Widget child,
    VoidCallback? onOpen,
    VoidCallback? onClose,
    bool barrierDismissible = true,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.md,
  })  : props = COverflowMenuProps(
          controller: controller,
          barrierDismissible: barrierDismissible,
          items: items,
          menuOffset: menuOffset,
          onOpen: onOpen,
          child: child,
          onClose: onClose,
          size: size,
        ),
        super(key: key);

  final COverflowMenuProps props;

  @override
  _COverflowMenuState createState() => _COverflowMenuState();
}

class _COverflowMenuState extends State<COverflowMenu> with TickerProviderStateMixin {
  final _colors = COverflowMenuStyle.colors;
  final _layouts = COverflowMenuStyle.layouts;

  final _menuKey = GlobalKey();

  late AnimationController _animationController;
  late Animation<double> _animation;
  late COverflowMenuDirection _direction;
  late Size _screenSize;
  late Offset _menuOffset;

  BuildContext? _childContext;
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;

  bool _isOpen = false;

  /// styles helpers

  String _cwidget = 'overflowmenu';
  String _size = '';

  Size get _menuItemDimension => _layouts['$_cwidget-item-$_size-dimensions'];

  double get _menuWidth => _menuItemDimension.width;
  double get _menuHeight => _menuItemDimension.height * widget.props.items.length;

  bool get _isBottom => _direction == COverflowMenuDirection.bottom;
  bool get _isReady => _menuKey.currentContext != null;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: _layouts['$_cwidget-animation-duration']);
    _animation = CurvedAnimation(parent: _animationController, curve: _layouts['$_cwidget-animation-curve']);

    widget.props.controller.addListener(() {
      if (_isOpen != widget.props.controller.isOpen) {
        setState(() => _isOpen = widget.props.controller.isOpen);
      }
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_menuKey.currentContext != _childContext) {
        setState(() => _childContext = _menuKey.currentContext);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.props.controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _showOverlay() {
    Future.delayed(Duration.zero, () async {
      // Init menu variables.
      _size = enumToString(widget.props.size);
      _screenSize = window.physicalSize / window.devicePixelRatio;
      _menuOffset = _calculateMenuOffset();

      // Init the overlay entry.
      _overlayState = Overlay.of(_childContext!)!;
      _overlayEntry = OverlayEntry(builder: (_) => _buildOverflowMenu());

      _animationController.addListener(_refreshOverlayState);
      _animationController.forward();

      _overlayState!.insert(_overlayEntry!);
      await Future.delayed(_layouts['$_cwidget-animation-duration']);
      widget.props.onOpen?.call();
    });
  }

  void _hideOverlay() {
    if (_overlayEntry == null) return;

    _animationController.reverse();

    Future.delayed(_layouts['$_cwidget-animation-duration'], () {
      _animationController.removeListener(_refreshOverlayState);
      _overlayEntry!.remove();
      _overlayEntry = null;
      _overlayState = null;

      widget.props.onClose?.call();
    });
  }

  void _refreshOverlayState() {
    _overlayState?.setState(() {});
  }

  Widget _buildOverflowMenu() {
    return Provider.value(
      value: widget.props,
      child: Stack(
        children: [
          if (widget.props.barrierDismissible)
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragStart: (_) => widget.props.controller.close(),
                onHorizontalDragStart: (_) => widget.props.controller.close(),
                onTap: () => widget.props.controller.close(),
              ),
            ),
          Positioned(
            left: _menuOffset.dx,
            top: _menuOffset.dy,
            child: Material(
              color: CColors.transparent,
              child: FadeTransition(
                opacity: _animation,
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
                    children: widget.props.items,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Rect _calculateChildRect() {
    final renderBox = _childContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
  }

  Offset _calculateMenuOffset() {
    final childRect = _calculateChildRect();

    double dx = childRect.left;
    double dy = childRect.top;

    // If the menu is at the right side of the screen.
    if (dx + _menuWidth > _screenSize.width) {
      dx = dx + childRect.width - _menuWidth;
    }

    if ((dy + _menuHeight + childRect.height) > _screenSize.height) {
      dy -= _menuHeight;
      _direction = COverflowMenuDirection.top;
    } else {
      dy += childRect.height;
      _direction = COverflowMenuDirection.bottom;
    }

    // Add the [props.offset].

    if (_direction == COverflowMenuDirection.bottom) {
      dx += widget.props.menuOffset.dx;
      dy += widget.props.menuOffset.dy;
    } else {
      dx -= widget.props.menuOffset.dx;
      dy -= widget.props.menuOffset.dy;
    }

    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    if (_isReady) {
      _isOpen ? _showOverlay() : _hideOverlay();
    }

    return SizedBox(key: _menuKey, child: widget.props.child);
  }
}
