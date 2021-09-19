import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

abstract class CBreadcrumbItemStyle {
  static const Map<String, dynamic> layouts = {
    'breadcrumb-item-spacing': 4.0,
    'breadcrumb-item-border-radius': 4.0,
    'breadcrumb-item-animation-duration': Duration(milliseconds: 100),
    'breadcrumb-item-animation-curve': Curves.linear,
  };

  static const Map<String, Color> colors = {
    'breadcrumb-item-color': CColors.blue40,
    'breadcrumb-item-current-color': CColors.gray10,
    'breadcrumb-item-enabled-background-color': CColors.gray100,
    'breadcrumb-item-focus-background-color': CColors.gray90,
  };
}
