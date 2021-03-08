import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';
import 'package:stylex/stylex.dart';

final radiobuttonG100 = StyleX({
  'radiobutton-border-color-animation-duration': Duration(milliseconds: 65),
  'radiobutton-border-color-animation-curve': Curves.linear,

  'radiobutton-fill-color-animation-duration': Duration(milliseconds: 100),
  'radiobutton-fill-color-animation-curve': Curves.linear,

  // border-color
  'radiobutton-enabled-border-color': CColors.white0,
  'radiobutton-focus-border-color': CColors.white0,
  'radiobutton-disabled-border-color': CColors.gray70,

  // fill-color
  'radiobutton-enabled-fill-color': CColors.white0,
  'radiobutton-focus-fill-color': CColors.white0,
  'radiobutton-disabled-fill-color': CColors.gray70,

  // checkmark-color
  'radiobutton-enabled-checkmark-color': CColors.gray100,
  'radiobutton-focus-checkmark-color': CColors.gray100,
  'radiobutton-disabled-checkmark-color': CColors.gray50,

  // label-color
  'radiobutton-enabled-label-color': CColors.gray10,
  'radiobutton-focus-label-color': CColors.gray10,
  'radiobutton-disabled-label-color': CColors.gray70,
});
