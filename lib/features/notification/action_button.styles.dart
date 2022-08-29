import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';

import 'notification.widget.dart';

abstract class CNotificationActionButtonStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 150),
    'curve': Curves.easeInOut,
  };

  static const Map<CNotificationContrast, Color> textColor = {
    CNotificationContrast.high: CColors.blue60,
    CNotificationContrast.low: CColors.blue40,
  };

  static const Map<CWidgetState, Map<CNotificationContrast, Color>> backgroundColor = {
    CWidgetState.enabled: {
      CNotificationContrast.high: CColors.gray10,
      CNotificationContrast.low: CColors.gray90,
    },
    CWidgetState.focused: {
      CNotificationContrast.high: CColors.gray20,
      CNotificationContrast.low: CColors.gray80,
    },
  };
}
