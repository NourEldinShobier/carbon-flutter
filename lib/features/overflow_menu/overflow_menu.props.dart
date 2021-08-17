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

class COverflowMenuButtonProps extends COverflowMenuProps {
  final String? iconDescription; //TODO:
  final VoidCallback? onTap;
  final Widget child;
  final bool light;
  final bool open;

  COverflowMenuButtonProps({
    required this.iconDescription,
    required this.onTap,
    required this.child,
    required this.light,
    required this.open,
    required GlobalKey key,
    required BuildContext context,
    required List<COverflowMenuItem> items,
    required Offset menuOffset,
    required VoidCallback? onClose,
    required VoidCallback? onOpen,
    required COverflowMenuSize size,
  }) : super(
          key: key,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
        );
}
