import 'package:flutter/widgets.dart';

import 'overflow_menu.enum.dart';
import 'overflow_menu.props.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuButtonProps extends COverflowMenuProps {
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
    required COverflowMenuController controller,
    required bool barrierDismissible,
    required Widget child,
  }) : super(
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          controller: controller,
          barrierDismissible: barrierDismissible,
          child: child,
        );
}
