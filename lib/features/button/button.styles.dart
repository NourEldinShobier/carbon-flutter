import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

import 'button.enum.dart';

abstract class CButtonStyles {
  static const Map<CButtonKind, Map<CWidgetState, Color>> contentColor = {
    CButtonKind.primary: {
      CWidgetState.enabled: CColors.white0,
      CWidgetState.focused: CColors.white0,
      CWidgetState.disabled: CColors.gray60,
    },
    CButtonKind.secondary: {
      CWidgetState.enabled: CColors.white0,
      CWidgetState.focused: CColors.white0,
      CWidgetState.disabled: CColors.gray60,
    },
    CButtonKind.danger: {
      CWidgetState.enabled: CColors.white0,
      CWidgetState.focused: CColors.white0,
      CWidgetState.disabled: CColors.gray60,
    },
    CButtonKind.tertiary: {
      CWidgetState.enabled: CColors.white0,
      CWidgetState.focused: CColors.gray100,
      CWidgetState.disabled: CColors.gray70,
    },
    CButtonKind.ghost: {
      CWidgetState.enabled: CColors.blue40,
      CWidgetState.focused: CColors.blue40,
      CWidgetState.disabled: CColors.gray70,
    },
  };

  static const Map<CButtonKind, Map<CWidgetState, Color>> backgroundColor = {
    CButtonKind.primary: {
      CWidgetState.enabled: CColors.blue60,
      CWidgetState.focused: CColors.blue70,
      CWidgetState.disabled: CColors.gray70,
    },
    CButtonKind.secondary: {
      CWidgetState.enabled: CColors.gray60,
      CWidgetState.focused: CColors.gray70,
      CWidgetState.disabled: CColors.gray70,
    },
    CButtonKind.danger: {
      CWidgetState.enabled: CColors.red60,
      CWidgetState.focused: CColors.red70,
      CWidgetState.disabled: CColors.gray70,
    },
    CButtonKind.tertiary: {
      CWidgetState.enabled: CColors.gray100,
      CWidgetState.focused: CColors.gray10,
      CWidgetState.disabled: CColors.gray100,
    },
    CButtonKind.ghost: {
      CWidgetState.enabled: CColors.transparent,
      CWidgetState.focused: CColors.gray80,
      CWidgetState.disabled: CColors.gray100,
    },
  };

  static final Map<CButtonKind, Map<CWidgetState, Border>> firstBorder = {
    CButtonKind.primary: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.gray100, width: 4),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.secondary: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.gray100, width: 4),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.danger: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.gray100, width: 4),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.tertiary: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.gray100, width: 4),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.ghost: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
  };

  static final Map<CButtonKind, Map<CWidgetState, Border>> secondBorder = {
    CButtonKind.primary: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.white0, width: 2),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.secondary: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.white0, width: 2),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.danger: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.white0, width: 2),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
    CButtonKind.tertiary: {
      CWidgetState.enabled: Border.all(color: CColors.white0, width: 1),
      CWidgetState.focused: Border.all(color: CColors.white0, width: 2),
      CWidgetState.disabled: Border.all(color: CColors.gray70, width: 1),
    },
    CButtonKind.ghost: {
      CWidgetState.enabled: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.focused: Border.all(color: CColors.transparent, width: 0),
      CWidgetState.disabled: Border.all(color: CColors.transparent, width: 0),
    },
  };

  static final Map<String, dynamic> backgroundColorAnimation = {
    'duration': Duration(milliseconds: 65),
    'curve': Curves.easeInOut,
  };

  static final Map<CButtonKind, Map<String, dynamic>> firstBorderAnimation = {
    CButtonKind.primary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.secondary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.danger: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.tertiary: {
      'duration': Duration(milliseconds: 80),
      'curve': Curves.easeInOut,
    },
    CButtonKind.ghost: {
      'duration': Duration(milliseconds: 80),
      'curve': Curves.easeInOut,
    },
  };

  static final Map<CButtonKind, Map<String, dynamic>> secondBorderAnimation = {
    CButtonKind.primary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.secondary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.danger: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.tertiary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.ghost: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
  };

  static final Map<CButtonSize, Size> size = {
    CButtonSize.regular: Size(48, 48),
    CButtonSize.md: Size(40, 40),
    CButtonSize.sm: Size(32, 32),
  };

  static final Map<CButtonSize, double> padding = {
    CButtonSize.regular: 16.0,
    CButtonSize.md: 16.0,
    CButtonSize.sm: 13.0,
  };
}
