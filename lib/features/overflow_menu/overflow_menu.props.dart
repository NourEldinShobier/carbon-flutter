import 'package:flutter/widgets.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuProps {
  final List<COverflowMenuItem> items;
  final Offset menuOffset;
  final VoidCallback? onClose;
  final VoidCallback? onOpen;
  final COverflowMenuSize size;
  final Widget child;
  final bool barrierDismissible;
  final COverflowMenuController controller;

  COverflowMenuProps({
    required this.items,
    required this.menuOffset,
    required this.onClose,
    required this.onOpen,
    required this.size,
    required this.child,
    required this.barrierDismissible,
    required this.controller,
  });
}
