import 'package:flutter/widgets.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuBaseProps {
  final List<COverflowMenuItem> items;
  final Offset menuOffset;
  final VoidCallback? onClose;
  final VoidCallback? onOpen;
  final COverflowMenuSize size;
  final bool barrierDismissible;

  COverflowMenuBaseProps({
    required this.items,
    required this.menuOffset,
    required this.onClose,
    required this.onOpen,
    required this.size,
    required this.barrierDismissible,
  });
}

class COverflowMenuProps extends COverflowMenuBaseProps {
  final COverflowMenuController controller;
  final Widget child;

  COverflowMenuProps({
    required this.controller,
    required this.child,
    required List<COverflowMenuItem> items,
    required Offset menuOffset,
    required VoidCallback? onClose,
    required VoidCallback? onOpen,
    required COverflowMenuSize size,
    required bool barrierDismissible,
  }) : super(
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
        );
}

class COverflowMenuButtonProps extends COverflowMenuBaseProps {
  final String? iconDescription; //TODO:
  final Widget icon;
  final bool enable;

  COverflowMenuButtonProps({
    required this.enable,
    required this.iconDescription,
    required this.icon,
    required List<COverflowMenuItem> items,
    required Offset menuOffset,
    required VoidCallback? onClose,
    required VoidCallback? onOpen,
    required COverflowMenuSize size,
    required bool barrierDismissible,
  }) : super(
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
        );
}
