import 'package:flutter/material.dart';
import 'package:carbon_flutter/shared/index.dart';

abstract class CTileStyle {
  static const Map<String, dynamic> styles = {
    'tile-padding': EdgeInsets.all(16),

    'tile-enabled-background-color': CColors.gray90,
    'tile-enabled-label-color': CColors.gray30,
    'tile-enabled-title-color': CColors.gray10,
    'tile-enabled-description-color': CColors.gray30,
    //
    'tile-disabled-background-color': CColors.gray90,
    'tile-disabled-label-color': CColors.gray70,
    'tile-disabled-title-color': CColors.gray70,
    'tile-disabled-description-color': CColors.gray70,
  };
}
