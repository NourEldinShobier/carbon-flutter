import 'package:flutter/widgets.dart';
import 'form.widget.dart';

extension CFormContextExtension on BuildContext {
  CFormState? get cform {
    return CForm.of(this);
  }
}
