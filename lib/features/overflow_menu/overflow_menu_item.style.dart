import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

abstract class COverflowMenuItemStyle {
  static const Map<String, dynamic> layouts = {
    'overflowmenu-item-animation-duration': Duration(milliseconds: 100),
    'overflowmenu-item-animation-curve': Curves.linear,
    'overflowmenu-item-regular-dimensions': Size(160, 48),
    'overflowmenu-item-md-dimensions': Size(160, 40),
    'overflowmenu-item-sm-dimensions': Size(160, 32),
    'overflowmenu-item-regular-padding': 16.0,
    'overflowmenu-item-md-padding': 16.0,
    'overflowmenu-item-sm-padding': 13.0,
  };

  static const Map<String, Color> colors = {
    // divider-color

    'overflowmenu-item-divider-color': CColors.gray80,

    // background-color

    'overflowmenu-item-primary-enabled-background-color': CColors.gray90,
    'overflowmenu-item-primary-focus-background-color': CColors.gray80,
    'overflowmenu-item-primary-disabled-background-color': CColors.gray90,

    'overflowmenu-item-delete-enabled-background-color': CColors.gray90,
    'overflowmenu-item-delete-focus-background-color': CColors.red60,
    'overflowmenu-item-delete-disabled-background-color': CColors.gray90,
  };
}
