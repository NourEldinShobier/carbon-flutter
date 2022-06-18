import 'text_field.widget.dart';

extension CValidationKindExtension on CValidationKind {
  CTextfieldKind get toTextFieldKind {
    if (this == CValidationKind.success) return CTextfieldKind.success;
    if (this == CValidationKind.warning) return CTextfieldKind.warning;
    return CTextfieldKind.error;
  }
}
