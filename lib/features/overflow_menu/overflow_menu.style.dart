import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu_item.style.dart';

abstract class COverflowMenuStyle {
  static Map<String, dynamic> layouts = {
    'overflowmenu-item-regular-dimensions': COverflowMenuItemStyle.layouts['overflowmenu-item-regular-dimensions'],
    'overflowmenu-item-md-dimensions': COverflowMenuItemStyle.layouts['overflowmenu-item-md-dimensions'],
    'overflowmenu-item-sm-dimensions': COverflowMenuItemStyle.layouts['overflowmenu-item-sm-dimensions'],
  };

  static const Map<String, Color> colors = {
    'overflowmenu-background-color': CColors.gray90,
  };
}
