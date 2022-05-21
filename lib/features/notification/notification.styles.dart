import 'package:carbon/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'notification.widget.dart';

abstract class CNotificationStyles {
  static const contentPadding = EdgeInsets.only(top: 14.5, bottom: 14);

  static const Map<CNotificationContrast, Color> backgroundColor = {
    CNotificationContrast.high: CColors.gray10,
    CNotificationContrast.low: CColors.gray90,
  };

  static const Map<CNotificationContrast, Color> textColor = {
    CNotificationContrast.high: CColors.gray100,
    CNotificationContrast.low: CColors.gray10,
  };

  static const Map<CNotificationKind, Border> toastNotificationBorder = {
    CNotificationKind.error: Border(left: BorderSide(width: 3, color: CColors.red50)),
    CNotificationKind.info: Border(left: BorderSide(width: 3, color: CColors.blue50)),
    CNotificationKind.success: Border(left: BorderSide(width: 3, color: CColors.green40)),
    CNotificationKind.warning: Border(left: BorderSide(width: 3, color: CColors.yellow30)),
  };

  static const Map<CNotificationContrast, Map<CNotificationKind, Border>> inlineNotificationBorder = {
    CNotificationContrast.high: {
      CNotificationKind.error: Border(left: BorderSide(width: 3, color: CColors.red50)),
      CNotificationKind.info: Border(left: BorderSide(width: 3, color: CColors.blue50)),
      CNotificationKind.success: Border(left: BorderSide(width: 3, color: CColors.green40)),
      CNotificationKind.warning: Border(left: BorderSide(width: 3, color: CColors.yellow30)),
    },
    CNotificationContrast.low: {
      CNotificationKind.error: Border(
        left: BorderSide(width: 3, color: CColors.red50),
        right: BorderSide(width: 1, color: CColors.red50),
        top: BorderSide(width: 1, color: CColors.red50),
        bottom: BorderSide(width: 1, color: CColors.red50),
      ),
      CNotificationKind.info: Border(
        left: BorderSide(width: 3, color: CColors.blue50),
        right: BorderSide(width: 1, color: CColors.blue50),
        top: BorderSide(width: 1, color: CColors.blue50),
        bottom: BorderSide(width: 1, color: CColors.blue50),
      ),
      CNotificationKind.success: Border(
        left: BorderSide(width: 3, color: CColors.green40),
        right: BorderSide(width: 1, color: CColors.green40),
        top: BorderSide(width: 1, color: CColors.green40),
        bottom: BorderSide(width: 1, color: CColors.green40),
      ),
      CNotificationKind.warning: Border(
        left: BorderSide(width: 3, color: CColors.yellow30),
        right: BorderSide(width: 1, color: CColors.yellow30),
        top: BorderSide(width: 1, color: CColors.yellow30),
        bottom: BorderSide(width: 1, color: CColors.yellow30),
      ),
    },
  };
}

abstract class CNotificationAssets {
  static const Map<CNotificationContrast, String> closeIcon = {
    CNotificationContrast.high: 'assets/svg/notification/close-highcontrast.svg',
    CNotificationContrast.low: 'assets/svg/notification/close-lowcontrast.svg',
  };

  static const Map<CNotificationContrast, Map<CNotificationKind, String>> kindIcon = {
    CNotificationContrast.high: {
      CNotificationKind.error: 'assets/svg/notification/error-highcontrast.svg',
      CNotificationKind.info: 'assets/svg/notification/info-highcontrast.svg',
      CNotificationKind.success: 'assets/svg/notification/success-highcontrast.svg',
      CNotificationKind.warning: 'assets/svg/notification/warning-highcontrast.svg',
    },
    CNotificationContrast.low: {
      CNotificationKind.error: 'assets/svg/notification/error-lowcontrast.svg',
      CNotificationKind.info: 'assets/svg/notification/info-lowcontrast.svg',
      CNotificationKind.success: 'assets/svg/notification/success-lowcontrast.svg',
      CNotificationKind.warning: 'assets/svg/notification/warning-lowcontrast.svg',
    },
  };
}
