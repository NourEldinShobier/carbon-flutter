import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';

const Map<String, dynamic> cBreadcrumbLayout = {
  'breadcrumb-item-spacing': 4,
  'breadcrumb-item-border-radius': 4,
  'breadcrumb-animation-duration': Duration(milliseconds: 100),
  'breadcrumb-animation-curve': Curves.linear,
};

const Map<String, Color> cBreadcrumbColors = {
  'breadcrumb-slash-color': CColors.gray10,
  'breadcrumb-item-color': CColors.blue40,
  'breadcrumb-item-current-color': CColors.gray10,
  'breadcrumb-item-enabled-background-color': CColors.gray100,
  'breadcrumb-item-focus-background-color': CColors.gray90,
};
