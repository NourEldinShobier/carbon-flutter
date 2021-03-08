import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

const Map<String, dynamic> cFormLayout = {
  'form-modal-padding': const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
  'form-group-padding': const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 24),
};

const Map<String, Color> cFormG100 = {
  // background-color
  'form-modal-background-color': CColors.gray90,
  'form-group-background-color': CColors.gray100,

  // label-color
  'form-modal-label-color': CColors.gray30,
  'form-group-label-color': CColors.gray30,

  // title-color
  'form-modal-title-color': CColors.gray10,
  'form-group-title-color': CColors.gray10,

  // description-color
  'form-modal-description-color': CColors.gray30,
  'form-group-description-color': CColors.gray10,
};
