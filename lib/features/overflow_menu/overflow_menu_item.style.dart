import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

abstract class COverflowMenuItemStyle {
  static final Map<String, dynamic> styles = {
    'overflowmenu-item-animation-duration': Duration(milliseconds: 100),
    'overflowmenu-item-animation-curve': Curves.linear,
    'overflowmenu-item-regular-dimensions': Size(160, 48),
    'overflowmenu-item-md-dimensions': Size(160, 40),
    'overflowmenu-item-sm-dimensions': Size(160, 32),
    'overflowmenu-item-regular-padding': const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    'overflowmenu-item-md-padding': const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    'overflowmenu-item-sm-padding': const EdgeInsets.symmetric(vertical: 0, horizontal: 13),

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
