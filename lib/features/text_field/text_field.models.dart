import 'package:flutter/material.dart';

import 'text_field.widget.dart';

class CValidationResult {
  CValidationResult({required this.kind, required this.message, this.icon});

  final String message;
  final Widget? icon;
  final CValidationKind kind;
}
