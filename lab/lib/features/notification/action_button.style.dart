import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';

abstract class CNotificationActionButtonStyle {
  static const Map<String, dynamic> layouts = {
    'action-button-background-color-animation-duration': Duration(milliseconds: 150),
    'action-button-background-color-animation-curve': Curves.easeInOut,
  };

  static const Map<String, Color> colors = {
    'action-button-lowcontrast-text-color': CColors.blue40,
    'action-button-highcontrast-text-color': CColors.blue60,

    //
    'action-button-enabled-lowcontrast-background-color': CColors.gray90,
    'action-button-focus-lowcontrast-background-color': CColors.gray80,
    //
    'action-button-enabled-highcontrast-background-color': CColors.gray10,
    'action-button-focus-highcontrast-background-color': CColors.gray20,
  };
}
