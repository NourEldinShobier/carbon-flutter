import 'package:flutter/material.dart';

import 'enable.widget.dart';

extension CEnableContextExtension on BuildContext {
  bool? get inheritedEnable {
    return CEnable.of(this);
  }
}
