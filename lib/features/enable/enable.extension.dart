import 'package:flutter/material.dart';

import 'enable.widget.dart';

extension CEnableContextExtension on BuildContext {
  bool get inheritedEnable {
    final temp = CEnable.of(this);

    return temp == null ? true : temp;
  }
}
