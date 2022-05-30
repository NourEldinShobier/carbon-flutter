import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu.widget.dart';
import 'overflow_menu_item.widget.dart';

abstract class COverflowMenuItemStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 100),
    'curve': Curves.linear,
  };

  static const Map<COverflowMenuSize, Size> dimensions = {
    COverflowMenuSize.regular: Size(160, 48),
    COverflowMenuSize.md: Size(160, 40),
    COverflowMenuSize.sm: Size(160, 32),
  };

  static const Map<COverflowMenuSize, EdgeInsets> padding = {
    COverflowMenuSize.regular: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    COverflowMenuSize.md: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    COverflowMenuSize.sm: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
  };

  static const Color dividerColor = CColors.gray80;

  static const Map<COverflowMenuItemKind, Map<CWidgetState, Color>> backgroundColor = {
    COverflowMenuItemKind.primary: {
      CWidgetState.enabled: CColors.gray90,
      CWidgetState.focused: CColors.gray80,
      CWidgetState.disabled: CColors.gray90,
    },
    COverflowMenuItemKind.delete: {
      CWidgetState.enabled: CColors.gray90,
      CWidgetState.focused: CColors.red60,
      CWidgetState.disabled: CColors.gray90,
    },
  };
}
