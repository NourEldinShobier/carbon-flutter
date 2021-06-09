import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';

abstract class CCheckboxStyle {
  static const Map<String, dynamic> layouts = {
    'checkbox-border-color-animation-duration': Duration(milliseconds: 65),
    'checkbox-border-color-animation-curve': Curves.linear,
    'checkbox-fill-color-animation-duration': Duration(milliseconds: 100),
    'checkbox-fill-color-animation-curve': Curves.linear,
  };

  static const Map<String, Color> colors = {
    // border-color
    'checkbox-enabled-border-color': CColors.white0,
    'checkbox-focus-border-color': CColors.white0,
    'checkbox-disabled-border-color': CColors.gray70,

    // fill-color
    'checkbox-enabled-fill-color': CColors.white0,
    'checkbox-focus-fill-color': CColors.white0,
    'checkbox-disabled-fill-color': CColors.gray70,

    // checkmark-color
    'checkbox-enabled-checkmark-color': CColors.gray100,
    'checkbox-focus-checkmark-color': CColors.gray100,
    'checkbox-disabled-checkmark-color': CColors.gray50,

    // label-color
    'checkbox-enabled-label-color': CColors.gray10,
    'checkbox-focus-label-color': CColors.gray10,
    'checkbox-disabled-label-color': CColors.gray70,
  };
}
