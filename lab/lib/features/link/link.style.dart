import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';

abstract class CLinkStyle {
  static const Map<String, dynamic> layouts = {};

  static const Map<String, Color> colors = {
    // text-color
    'link-enabled-text-color': CColors.blue40,
    'link-disabled-text-color': CColors.gray70,
  };
}
