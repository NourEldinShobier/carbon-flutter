import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';

class CValidationResult {
  CValidationResult({required this.type, required this.message, this.icon});

  final String message;
  final Widget? icon;
  final CValidationResultType type;
}
