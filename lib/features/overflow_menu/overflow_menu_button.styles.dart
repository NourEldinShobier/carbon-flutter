import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

import 'overflow_menu.widget.dart';

abstract class COverflowMenuButtonStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 100),
    'curve': Curves.linear,
  };

  static const Map<CWidgetState, Color> backgroundColor = {
    CWidgetState.enabled: CColors.gray100,
    CWidgetState.focused: CColors.gray90,
    CWidgetState.disabled: CColors.gray100,
  };

  static const Map<COverflowMenuSize, Size> dimensions = {
    COverflowMenuSize.regular: Size(48, 48),
    COverflowMenuSize.md: Size(40, 40),
    COverflowMenuSize.sm: Size(32, 32),
  };
}
