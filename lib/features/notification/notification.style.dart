import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

abstract class CNotificationStyle {
  static const Map<String, String> assets = {
    'notification-highcontrast-close-icon': 'assets/svg/notification/close-highcontrast.svg',
    'notification-lowcontrast-close-icon': 'assets/svg/notification/close-lowcontrast.svg',
    //
    'notification-highcontrast-error-icon': 'assets/svg/notification/error-highcontrast.svg',
    'notification-lowcontrast-error-icon': 'assets/svg/notification/error-lowcontrast.svg',
    //
    'notification-highcontrast-info-icon': 'assets/svg/notification/info-highcontrast.svg',
    'notification-lowcontrast-info-icon': 'assets/svg/notification/info-lowcontrast.svg',
    //
    'notification-highcontrast-success-icon': 'assets/svg/notification/success-highcontrast.svg',
    'notification-lowcontrast-success-icon': 'assets/svg/notification/success-lowcontrast.svg',
    //
    'notification-highcontrast-warning-icon': 'assets/svg/notification/warning-highcontrast.svg',
    'notification-lowcontrast-warning-icon': 'assets/svg/notification/warning-lowcontrast.svg',
  };

  static const Map<String, dynamic> layouts = {
    'notification-inline-lowcontrast-border-width': <double>[1, 1, 1, 3],
    'notification-inline-highcontrast-border-width': <double>[0, 0, 0, 3],
    'notification-toast-border-width': <double>[0, 0, 0, 3],
    'notification-padding': <double>[14.5, 0, 14, 14],
  };

  static const Map<String, Color> colors = {
    'notification-highcontrast-background-color': CColors.gray10,
    'notification-lowcontrast-background-color': CColors.gray90,
    'notification-highcontrast-text-color': CColors.gray100,
    'notification-lowcontrast-text-color': CColors.gray10,
    'notification-error-border-color': CColors.red50,
    'notification-info-border-color': CColors.blue50,
    'notification-success-border-color': CColors.green40,
    'notification-warning-border-color': CColors.yellow30,
  };
}
