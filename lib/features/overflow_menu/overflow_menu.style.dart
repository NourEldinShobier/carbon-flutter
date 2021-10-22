import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu_item.style.dart';

abstract class COverflowMenuStyle {
  static final Map<String, dynamic> styles = {
    'overflowmenu-animation-duration': Duration(milliseconds: 100),
    'overflowmenu-animation-curve': Curves.linear,
    'overflowmenu-item-regular-dimensions': COverflowMenuItemStyle.styles['overflowmenu-item-regular-dimensions'],
    'overflowmenu-item-md-dimensions': COverflowMenuItemStyle.styles['overflowmenu-item-md-dimensions'],
    'overflowmenu-item-sm-dimensions': COverflowMenuItemStyle.styles['overflowmenu-item-sm-dimensions'],
    'overflowmenu-background-color': CColors.gray90,
  };
}
