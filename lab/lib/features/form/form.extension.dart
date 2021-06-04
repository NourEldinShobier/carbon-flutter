import 'package:flutter/material.dart';

import 'form.widget.dart';

extension CFormContextExtension on BuildContext {
  CFormState? get cform {
    return CForm.of(this);
  }
}
