import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

abstract class CButtonStyle {
  static final Map<String, dynamic> styles = {
    'button-regular-dimensions': Size(48, 48),
    'button-md-dimensions': Size(40, 40),
    'button-sm-dimensions': Size(32, 32),

    'button-regular-padding': 16.0,
    'button-md-padding': 16.0,
    'button-sm-padding': 13.0,

    //

    'button-background-color-animation-duration': Duration(milliseconds: 65),
    'button-background-color-animation-curve': Curves.easeInOut,

    /// primary ///

    // borders
    'button-primary-enabled-first-border': Border.all(color: CColors.transparent, width: 0),
    'button-primary-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-primary-disabled-first-border': Border.all(color: CColors.transparent, width: 0),

    'button-primary-enabled-second-border': Border.all(color: CColors.transparent, width: 0),
    'button-primary-focus-second-border': Border.all(color: CColors.white0, width: 2),
    'button-primary-disabled-second-border': Border.all(color: CColors.transparent, width: 0),

    'button-primary-first-border-animation-duration': Duration(milliseconds: 0),
    'button-primary-first-border-animation-curve': Curves.easeInOut,

    'button-primary-second-border-animation-duration': Duration(milliseconds: 0),
    'button-primary-second-border-animation-curve': Curves.easeInOut,

    /// secondary ///

    // borders
    'button-secondary-enabled-first-border': Border.all(color: CColors.transparent, width: 0),
    'button-secondary-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-secondary-disabled-first-border': Border.all(color: CColors.transparent, width: 0),

    'button-secondary-enabled-second-border': Border.all(color: CColors.transparent, width: 0),
    'button-secondary-focus-second-border': Border.all(color: CColors.white0, width: 2),
    'button-secondary-disabled-second-border': Border.all(color: CColors.transparent, width: 0),

    'button-secondary-first-border-animation-duration': Duration(milliseconds: 0),
    'button-secondary-first-border-animation-curve': Curves.easeInOut,

    'button-secondary-second-border-animation-duration': Duration(milliseconds: 0),
    'button-secondary-second-border-animation-curve': Curves.easeInOut,

    /// danger ///

    // borders
    'button-danger-enabled-first-border': Border.all(color: CColors.transparent, width: 0),
    'button-danger-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-danger-disabled-first-border': Border.all(color: CColors.transparent, width: 0),

    'button-danger-enabled-second-border': Border.all(color: CColors.transparent, width: 0),
    'button-danger-focus-second-border': Border.all(color: CColors.white0, width: 2),
    'button-danger-disabled-second-border': Border.all(color: CColors.transparent, width: 0),

    'button-danger-first-border-animation-duration': Duration(milliseconds: 0),
    'button-danger-first-border-animation-curve': Curves.easeInOut,

    'button-danger-second-border-animation-duration': Duration(milliseconds: 0),
    'button-danger-second-border-animation-curve': Curves.easeInOut,

    /// tertiary ///

    // borders
    'button-tertiary-enabled-first-border': Border.all(color: CColors.transparent, width: 0),
    'button-tertiary-focus-first-border': Border.all(color: CColors.gray100, width: 4),
    'button-tertiary-disabled-first-border': Border.all(color: CColors.transparent, width: 0),

    'button-tertiary-enabled-second-border': Border.all(color: CColors.white0, width: 1),
    'button-tertiary-focus-second-border': Border.all(color: CColors.white0, width: 2),
    'button-tertiary-disabled-second-border': Border.all(color: CColors.gray70, width: 1),

    'button-tertiary-first-border-animation-duration': Duration(milliseconds: 80),
    'button-tertiary-first-border-animation-curve': Curves.easeInOut,

    'button-tertiary-second-border-animation-duration': Duration(milliseconds: 0),
    'button-tertiary-second-border-animation-curve': Curves.easeInOut,

    /// ghost ///

    // borders
    'button-ghost-enabled-first-border': Border.all(color: CColors.transparent, width: 0),
    'button-ghost-focus-first-border': Border.all(color: CColors.transparent, width: 0),
    'button-ghost-disabled-first-border': Border.all(color: CColors.transparent, width: 0),

    'button-ghost-enabled-second-border': Border.all(color: CColors.transparent, width: 0),
    'button-ghost-focus-second-border': Border.all(color: CColors.transparent, width: 0),
    'button-ghost-disabled-second-border': Border.all(color: CColors.transparent, width: 0),

    'button-ghost-first-border-animation-duration': Duration(milliseconds: 80),
    'button-ghost-first-border-animation-curve': Curves.easeInOut,

    'button-ghost-second-border-animation-duration': Duration(milliseconds: 0),
    'button-ghost-second-border-animation-curve': Curves.easeInOut,

    /// primary ///

    // background-color
    'button-primary-enabled-background-color': CColors.blue60,
    'button-primary-focus-background-color': CColors.blue70,
    'button-primary-disabled-background-color': CColors.gray70,

    /// secondary ///

    // background-color
    'button-secondary-enabled-background-color': CColors.gray60,
    'button-secondary-focus-background-color': CColors.gray70,
    'button-secondary-disabled-background-color': CColors.gray70,

    /// danger ///

    // background-color
    'button-danger-enabled-background-color': CColors.red60,
    'button-danger-focus-background-color': CColors.red70,
    'button-danger-disabled-background-color': CColors.gray70,

    /// tertiary ///

    // background-color
    'button-tertiary-enabled-background-color': CColors.gray100,
    'button-tertiary-focus-background-color': CColors.gray10,
    'button-tertiary-disabled-background-color': CColors.gray100,

    /// ghost ///

    // background-color
    'button-ghost-enabled-background-color': CColors.transparent,
    'button-ghost-focus-background-color': CColors.gray80,
    'button-ghost-disabled-background-color': CColors.gray100,
  };

  static const Map<String, dynamic> inheritedStyles = {
    'button-primary-enabled-content-color': CColors.white0,
    'button-primary-focus-content-color': CColors.white0,
    'button-primary-disabled-content-color': CColors.gray60,
    //
    'button-secondary-enabled-content-color': CColors.white0,
    'button-secondary-focus-content-color': CColors.white0,
    'button-secondary-disabled-content-color': CColors.gray60,
    //
    'button-danger-enabled-content-color': CColors.white0,
    'button-danger-focus-content-color': CColors.white0,
    'button-danger-disabled-content-color': CColors.gray60,
    //
    'button-tertiary-enabled-content-color': CColors.white0,
    'button-tertiary-focus-content-color': CColors.gray100,
    'button-tertiary-disabled-content-color': CColors.gray70,
    //
    'button-ghost-enabled-content-color': CColors.blue40,
    'button-ghost-focus-content-color': CColors.blue40,
    'button-ghost-disabled-content-color': CColors.gray70,
  };
}
