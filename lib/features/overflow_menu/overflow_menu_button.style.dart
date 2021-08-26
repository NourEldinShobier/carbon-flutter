import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

abstract class COverflowMenuButtonStyle {
  static const Map<String, dynamic> layouts = {
    'overflowmenu-button-background-color-animation-duration': Duration(milliseconds: 100),
    'overflowmenu-button-background-color-animation-curve': Curves.linear,
    'overflowmenu-button-regular-dimensions': Size(48, 48),
    'overflowmenu-button-md-dimensions': Size(40, 40),
    'overflowmenu-button-sm-dimensions': Size(32, 32),
  };

  static const Map<String, Color> colors = {
    // background-color
    'overflowmenu-button-enabled-background-color': CColors.gray100,
    'overflowmenu-button-focus-background-color': CColors.gray90,
    'overflowmenu-button-disabled-background-color': CColors.gray100,
  };
}
