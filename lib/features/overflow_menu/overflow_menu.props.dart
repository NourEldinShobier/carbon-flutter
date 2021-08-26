import 'package:flutter/widgets.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuProps {
  final GlobalKey key;
  final List<COverflowMenuItem> items;
  final Offset menuOffset;
  final VoidCallback? onClose;
  final VoidCallback? onOpen;
  final COverflowMenuSize size;

  COverflowMenuProps({
    required this.key,
    required this.items,
    required this.menuOffset,
    required this.onClose,
    required this.onOpen,
    required this.size,
  });
}
