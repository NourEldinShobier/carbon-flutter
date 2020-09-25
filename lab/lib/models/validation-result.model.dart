import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';

class CValidationResult {
  CValidationResult({
    @required this.resultType,
    @required this.message,
    this.highlight = false,
    this.icon,
  });

  final bool highlight;
  final String message;
  final Widget icon;
  final CValidationResultType resultType;
}
