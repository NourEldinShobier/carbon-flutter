import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

extension CFormContextExtension on BuildContext {
  CFormState get cform {
    return CForm.of(this);
  }
}
