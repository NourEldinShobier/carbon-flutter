import 'package:flutter/widgets.dart';

import 'package:carbon_flutter/shared/index.dart';

import 'toggle.widget.dart';

abstract class CToggleStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 200),
    'curve': Curves.linear,
  };

  static const Map<CToggleSize, Size> dimensions = {
    CToggleSize.sm: Size(32, 16),
    CToggleSize.md: Size(48, 24),
  };

  static const Color outlineColor = CColors.white0;

  static const Map<CWidgetState, Color> indicatorColor = {
    CWidgetState.enabled: CColors.white0,
    CWidgetState.disabled: CColors.gray70,
  };

  static const Map<CWidgetState, Color> labelColor = {
    CWidgetState.enabled: CColors.gray30,
    CWidgetState.disabled: CColors.gray70,
  };

  static const Map<CWidgetState, Map<CToggleCheckStatus, Color>> fillColor = {
    CWidgetState.enabled: {
      CToggleCheckStatus.checked: CColors.green40,
      CToggleCheckStatus.unchecked: CColors.gray60,
    },
    CWidgetState.disabled: {
      CToggleCheckStatus.checked: CColors.gray90,
      CToggleCheckStatus.unchecked: CColors.gray90,
    },
  };

  static const Map<CWidgetState, Map<CToggleCheckStatus, Color>> checkmarkColor = {
    CWidgetState.enabled: {
      CToggleCheckStatus.checked: CColors.green40,
      CToggleCheckStatus.unchecked: CColors.gray60,
    },
    CWidgetState.disabled: {
      CToggleCheckStatus.checked: CColors.gray70,
      CToggleCheckStatus.unchecked: CColors.gray70,
    },
  };
}
