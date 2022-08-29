import 'package:flutter/material.dart';
import 'package:carbon_flutter/shared/index.dart';

import 'text_field.widget.dart';

abstract class CTextfieldStyles {
  static const double labelFontSize = 14.0;
  static const String labelFontFamily = CFonts.primaryRegular;

  static const double textFontSize = 14.0;
  static const String textFontFamily = CFonts.primaryRegular;

  static const double hintFontSize = 15.0;
  static const String hintFontFamily = CFonts.primaryRegular;

  static const double descriptionFontSize = 14.0;
  static const String descriptionFontFamily = CFonts.primaryRegular;

  static const Color cursorColor = CColors.gray10;

  static final Map<CTextfieldKind, Map<CWidgetState, InputBorder>> border = {
    CTextfieldKind.primary: {
      CWidgetState.enabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.gray60, width: 1),
      ),
      CWidgetState.focused: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.white0, width: 2),
      ),
      CWidgetState.disabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
    },
    CTextfieldKind.success: {
      CWidgetState.enabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.gray60, width: 1),
      ),
      CWidgetState.focused: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.green40, width: 2),
      ),
      CWidgetState.disabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
    },
    CTextfieldKind.warning: {
      CWidgetState.enabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.gray60, width: 1),
      ),
      CWidgetState.focused: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.yellow20, width: 2),
      ),
      CWidgetState.disabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
    },
    CTextfieldKind.error: {
      CWidgetState.enabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.gray60, width: 1),
      ),
      CWidgetState.focused: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: CColors.red50, width: 2),
      ),
      CWidgetState.disabled: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
    },
  };

  static final Map<CTextfieldKind, Map<CWidgetState, Color>> descriptionColor = {
    CTextfieldKind.primary: {
      CWidgetState.enabled: CColors.gray30,
      CWidgetState.focused: CColors.gray30,
      CWidgetState.disabled: CColors.gray70,
    },
    CTextfieldKind.success: {
      CWidgetState.enabled: CColors.gray30,
      CWidgetState.focused: CColors.green30,
      CWidgetState.disabled: CColors.gray70,
    },
    CTextfieldKind.warning: {
      CWidgetState.enabled: CColors.gray30,
      CWidgetState.focused: CColors.yellow30,
      CWidgetState.disabled: CColors.gray70,
    },
    CTextfieldKind.error: {
      CWidgetState.enabled: CColors.gray30,
      CWidgetState.focused: CColors.red40,
      CWidgetState.disabled: CColors.gray70,
    },
  };

  static final Map<CWidgetState, Color> textColor = {
    CWidgetState.enabled: CColors.gray10,
    CWidgetState.focused: CColors.gray10,
    CWidgetState.disabled: CColors.gray70,
  };

  static final Map<CWidgetState, Color> labelColor = {
    CWidgetState.enabled: CColors.gray30,
    CWidgetState.focused: CColors.gray30,
    CWidgetState.disabled: CColors.gray70,
  };

  static final Map<CWidgetState, Color> hintColor = {
    CWidgetState.enabled: CColors.gray60,
    CWidgetState.focused: CColors.gray60,
    CWidgetState.disabled: CColors.gray70,
  };

  static final Map<CWidgetState, Color> backgroundColor = {
    CWidgetState.enabled: CColors.gray90,
    CWidgetState.focused: CColors.gray90,
    CWidgetState.disabled: CColors.gray90,
  };

  static final Map<CWidgetState, Color> iconColor = {
    CWidgetState.enabled: CColors.gray10,
    CWidgetState.focused: CColors.gray10,
    CWidgetState.disabled: CColors.gray70,
  };
}
