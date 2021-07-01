import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';

abstract class CButtonStyle {
  static final Map<String, dynamic> layouts = {
    'button-background-color-animation-duration': Duration(milliseconds: 65),
    'button-background-color-animation-curve': Curves.easeInOut,

    /// primary ///

    // borders
    'button-primary-enabled-first-border': Border.all(color: Colors.transparent, width: 0),
    'button-primary-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-primary-disabled-first-border': Border.all(color: Colors.transparent, width: 0),

    'button-primary-enabled-second-border': Border.all(color: Colors.transparent, width: 0),
    'button-primary-focus-second-border': Border.all(color: Colors.white, width: 2),
    'button-primary-disabled-second-border': Border.all(color: Colors.transparent, width: 0),

    'button-primary-first-border-animation-duration': Duration(milliseconds: 0),
    'button-primary-first-border-animation-curve': Curves.easeInOut,

    'button-primary-second-border-animation-duration': Duration(milliseconds: 0),
    'button-primary-second-border-animation-curve': Curves.easeInOut,

    /// secondary ///

    // borders
    'button-secondary-enabled-first-border': Border.all(color: Colors.transparent, width: 0),
    'button-secondary-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-secondary-disabled-first-border': Border.all(color: Colors.transparent, width: 0),

    'button-secondary-enabled-second-border': Border.all(color: Colors.transparent, width: 0),
    'button-secondary-focus-second-border': Border.all(color: Colors.white, width: 2),
    'button-secondary-disabled-second-border': Border.all(color: Colors.transparent, width: 0),

    'button-secondary-first-border-animation-duration': Duration(milliseconds: 0),
    'button-secondary-first-border-animation-curve': Curves.easeInOut,

    'button-secondary-second-border-animation-duration': Duration(milliseconds: 0),
    'button-secondary-second-border-animation-curve': Curves.easeInOut,

    /// danger ///

    // borders
    'button-danger-enabled-first-border': Border.all(color: Colors.transparent, width: 0),
    'button-danger-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-danger-disabled-first-border': Border.all(color: Colors.transparent, width: 0),

    'button-danger-enabled-second-border': Border.all(color: Colors.transparent, width: 0),
    'button-danger-focus-second-border': Border.all(color: Colors.white, width: 2),
    'button-danger-disabled-second-border': Border.all(color: Colors.transparent, width: 0),

    'button-danger-first-border-animation-duration': Duration(milliseconds: 0),
    'button-danger-first-border-animation-curve': Curves.easeInOut,

    'button-danger-second-border-animation-duration': Duration(milliseconds: 0),
    'button-danger-second-border-animation-curve': Curves.easeInOut,

    /// tertiary ///

    // borders
    'button-tertiary-enabled-first-border': Border.all(color: Colors.transparent, width: 0),
    'button-tertiary-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-tertiary-disabled-first-border': Border.all(color: Colors.transparent, width: 0),

    'button-tertiary-enabled-second-border': Border.all(color: Colors.white, width: 1),
    'button-tertiary-focus-second-border': Border.all(color: Colors.white, width: 2),
    'button-tertiary-disabled-second-border': Border.all(color: CColors.gray70, width: 1),

    'button-tertiary-first-border-animation-duration': Duration(milliseconds: 80),
    'button-tertiary-first-border-animation-curve': Curves.easeInOut,

    'button-tertiary-second-border-animation-duration': Duration(milliseconds: 0),
    'button-tertiary-second-border-animation-curve': Curves.easeInOut,

    /// ghost ///

    // borders
    'button-ghost-enabled-first-border': Border.all(color: Colors.transparent, width: 0),
    'button-ghost-focus-first-border': Border.all(color: Colors.transparent, width: 0),
    'button-ghost-disabled-first-border': Border.all(color: Colors.transparent, width: 0),

    'button-ghost-enabled-second-border': Border.all(color: Colors.transparent, width: 0),
    'button-ghost-focus-second-border': Border.all(color: Colors.transparent, width: 0),
    'button-ghost-disabled-second-border': Border.all(color: Colors.transparent, width: 0),

    'button-ghost-first-border-animation-duration': Duration(milliseconds: 80),
    'button-ghost-first-border-animation-curve': Curves.easeInOut,

    'button-ghost-second-border-animation-duration': Duration(milliseconds: 0),
    'button-ghost-second-border-animation-curve': Curves.easeInOut,
  };

  static const Map<String, Color> colors = {
    /// primary ///

    // content-color
    'button-primary-enabled-content-color': Colors.white,
    'button-primary-focus-content-color': Colors.white,
    'button-primary-disabled-content-color': CColors.gray60,

    // background-color
    'button-primary-enabled-background-color': CColors.blue60,
    'button-primary-focus-background-color': CColors.blue70,
    'button-primary-disabled-background-color': CColors.gray70,

    /// secondary ///

    // content-color
    'button-secondary-enabled-content-color': Colors.white,
    'button-secondary-focus-content-color': Colors.white,
    'button-secondary-disabled-content-color': CColors.gray60,

    // background-color
    'button-secondary-enabled-background-color': CColors.gray60,
    'button-secondary-focus-background-color': CColors.gray70,
    'button-secondary-disabled-background-color': CColors.gray70,

    /// danger ///

    // content-color
    'button-danger-enabled-content-color': Colors.white,
    'button-danger-focus-content-color': Colors.white,
    'button-danger-disabled-content-color': CColors.gray60,

    // background-color
    'button-danger-enabled-background-color': CColors.red60,
    'button-danger-focus-background-color': CColors.red70,
    'button-danger-disabled-background-color': CColors.gray70,

    /// tertiary ///

    // content-color
    'button-tertiary-enabled-content-color': Colors.white,
    'button-tertiary-focus-content-color': CColors.gray100,
    'button-tertiary-disabled-content-color': CColors.gray70,

    // background-color
    'button-tertiary-enabled-background-color': CColors.gray100,
    'button-tertiary-focus-background-color': CColors.gray10,
    'button-tertiary-disabled-background-color': CColors.gray100,

    /// ghost ///

    // content-color
    'button-ghost-enabled-content-color': CColors.blue40,
    'button-ghost-focus-content-color': CColors.blue40,
    'button-ghost-disabled-content-color': CColors.gray70,

    // background-color
    'button-ghost-enabled-background-color': CColors.transparent,
    'button-ghost-focus-background-color': CColors.gray80,
    'button-ghost-disabled-background-color': CColors.gray100,
  };
}
