import 'package:flutter/widgets.dart';

import 'overflow_menu.util.dart';
import 'overflow_menu.widget.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuBaseProps {
  /// A list of [COverflowMenuItem] to display in a column when
  /// the menu is open.
  ///
  /// @required
  final List<COverflowMenuItem> items;

  /// The adjustment in position applied to the menu.
  ///
  /// @default: `Offset.zero`
  final Offset menuOffset;

  /// Called after the menu is closed.
  ///
  /// @optional
  final VoidCallback? onClose;

  /// Called after the menu is open.
  ///
  /// @optional
  final VoidCallback? onOpen;

  /// The size of this menu. It can be `regular`, `sm`, or `md`
  ///
  /// @default: `COverflowMenuSize.md`
  final COverflowMenuSize size;

  /// Whether you can close the menu by tapping the barrier.
  ///
  /// @default: `true`
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
  /// An object that is used to control the menu.
  ///
  /// @required
  final COverflowMenuController controller;

  /// The [child] contained by the menu.
  ///
  /// @required
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
  /// The [icon] of the button.
  ///
  /// @required
  final Widget icon;

  /// A text to display in a tooltip.
  ///
  /// @optional
  final String? iconDescription; //TODO:

  /// Whether the button is enabled.
  ///
  /// @default: `true`
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

class COverflowMenuItemProps {
  /// The content of the item.
  ///
  /// @required
  final Widget child;

  /// Called when the item is tapped.
  ///
  /// @optional
  final VoidCallback? onTap;

  /// Whether the item is enabled.
  ///
  /// @default: `true`
  final bool enable;

  /// Whether this item has a divider.
  ///
  /// @default: `false`
  final bool hasDivider;

  /// To make this menu item a danger ghost button.
  ///
  /// @default: `false`
  final bool isDelete;

  COverflowMenuItemProps({
    required this.child,
    required this.onTap,
    required this.enable,
    required this.hasDivider,
    required this.isDelete,
  });
}
