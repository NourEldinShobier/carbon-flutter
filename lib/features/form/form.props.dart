import 'package:flutter/widgets.dart';

import 'form.enum.dart';

class CFormProps {
  final bool enable;
  final List<Widget> children;
  final CFormType type;
  final Widget? actions;

  CFormProps({
    required this.enable,
    required this.children,
    required this.type,
    required this.actions,
  });
}
