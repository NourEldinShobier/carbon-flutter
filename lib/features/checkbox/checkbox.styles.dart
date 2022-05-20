import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

abstract class CCheckboxStyles {
  static const Map<String, dynamic> borderAnimation = {
    'duration': Duration(milliseconds: 65),
    'curve': Curves.linear,
  };

  static const Map<String, dynamic> backgroundAnimation = {
    'duration': Duration(milliseconds: 100),
    'curve': Curves.linear,
  };

  static const Map<CWidgetState, Color> borderColor = {
    CWidgetState.enabled: CColors.white0,
    CWidgetState.focused: CColors.white0,
    CWidgetState.disabled: CColors.gray70,
  };

  static const Map<CWidgetState, Color> backgroundColor = {
    CWidgetState.enabled: CColors.white0,
    CWidgetState.focused: CColors.white0,
    CWidgetState.disabled: CColors.gray70,
  };

  static const Map<CWidgetState, Color> labelColor = {
    CWidgetState.enabled: CColors.gray10,
    CWidgetState.focused: CColors.gray10,
    CWidgetState.disabled: CColors.gray70,
  };

  static const Map<CWidgetState, Color> checkmarkColor = {
    CWidgetState.enabled: CColors.gray100,
    CWidgetState.focused: CColors.gray100,
    CWidgetState.disabled: CColors.gray50,
  };
}
