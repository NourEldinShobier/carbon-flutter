import 'package:flutter/widgets.dart';
import 'enable.widget.dart';

extension CEnableContextExtension on BuildContext {
  bool get inheritedEnable {
    final temp = CEnable.of(this);

    return temp == null ? true : temp;
  }
}
