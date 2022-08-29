import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/cupertino.dart';

abstract class CLinkStyles {
  static const Map<CWidgetState, Color> textColor = {
    CWidgetState.enabled: CColors.blue40,
    CWidgetState.disabled: CColors.gray70,
  };
}
