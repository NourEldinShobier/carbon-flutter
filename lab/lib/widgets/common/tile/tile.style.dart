import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';
import 'package:stylex/stylex.dart';

final _tile = StyleX({
  'tile-padding': const EdgeInsets.all(16),
});

final tileG100 = StyleX({
  // background-color
  'tile-background-color': CColors.gray90,

  // label-color
  'tile-label-color': CColors.gray30,

  // title-color
  'tile-title-color': CColors.gray10,

  // description-color
  'tile-description-color': CColors.gray30,
})
  ..inject(_tile);
