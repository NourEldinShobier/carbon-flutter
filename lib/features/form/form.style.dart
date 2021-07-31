import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

abstract class CFormStyle {
  static const Map<String, dynamic> layouts = {
    'form-blank-padding': const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
    'form-group-padding': const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 24),
  };

  static const Map<String, Color> colors = {
    // background-color
    'form-blank-enabled-background-color': CColors.gray90,
    'form-group-enabled-background-color': CColors.gray100,

    'form-blank-disabled-background-color': CColors.gray90,
    'form-group-disabled-background-color': CColors.gray100,

    // label-color
    'form-blank-enabled-label-color': CColors.gray30,
    'form-group-enabled-label-color': CColors.gray30,

    'form-blank-disabled-label-color': CColors.gray70,
    'form-group-disabled-label-color': CColors.gray70,

    // title-color
    'form-blank-enabled-title-color': CColors.gray10,
    'form-group-enabled-title-color': CColors.gray10,

    'form-blank-disabled-title-color': CColors.gray70,
    'form-group-disabled-title-color': CColors.gray70,

    // description-color
    'form-blank-enabled-description-color': CColors.gray30,
    'form-group-enabled-description-color': CColors.gray10,

    'form-blank-disabled-description-color': CColors.gray70,
    'form-group-disabled-description-color': CColors.gray70,
  };
}
