import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

abstract class CToggleStyle {
  static const Map<String, dynamic> layouts = {
    'toggle-animation-duration': Duration(milliseconds: 200),
    'toggle-animation-curve': Curves.linear,
    'toggle-sm-size': const Size(32, 16),
    'toggle-md-size': const Size(48, 24),
    'toggle-lg-size': const Size(48, 24),
    'toggle-xl-size': const Size(48, 24),
  };

  static const Map<String, Color> colors = {
    'toggle-outline-color': CColors.white0,

    // fill-color
    'toggle-enabled-checked-fill-color': CColors.green40,
    'toggle-enabled-unchecked-fill-color': CColors.gray60,
    'toggle-disabled-checked-fill-color': CColors.gray90,
    'toggle-disabled-unchecked-fill-color': CColors.gray90,

    // indicator-color
    'toggle-enabled-indicator-color': CColors.white0,
    'toggle-disabled-indicator-color': CColors.gray70,

    // checkmark-color
    'toggle-enabled-checked-checkmark-color': CColors.green40,
    'toggle-enabled-unchecked-checkmark-color': CColors.gray60,
    'toggle-disabled-checked-checkmark-color': CColors.gray70,
    'toggle-disabled-unchecked-checkmark-color': CColors.gray70,

    // label-color
    'toggle-enabled-label-color': CColors.gray30,
    'toggle-disabled-label-color': CColors.gray70,
  };
}
