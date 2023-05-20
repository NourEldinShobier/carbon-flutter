import 'dart:ui';

import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/foundation.dart';

/// {@template tag_props}
/// [CTagProps] are used with [CTag] to customize the style and behavior of the
/// component.
/// {@endtemplate}
@immutable
class CTagProps {
  /// Whether the tag is enabled or not.
  ///
  /// @default: `false`
  final bool disabled;

  /// Whether the tag is filter or not.
  ///
  /// @default: `false`
  final bool filter;

  /// A text to display inside the tag.
  ///
  /// @mandatory
  final String label;

  /// {@macro tag_size}
  final CTagSize size;

  /// {@macro tag_colors}
  final CTagColors _color;
  CTagColors get color => disabled ? CTagColors.disabled : _color;

  /// Creates a [CTagProps].
  const CTagProps({
    required this.disabled,
    required this.label,
    required this.filter,
    required CTagColors color,
    required this.size,
  }) : _color = color;
}

/// {@template tag_size}
/// The size of the tag.
/// [CTagSize.sm] is 24px and [CTagSize.md] is 18px.
/// {@endtemplate}
enum CTagSize { sm, md }

/// {@template tag_colors}
/// The color of the tag.
/// {@endtemplate}
enum CTagColors {
  red(CColors.red80, CColors.red40, CColors.red60),
  magenta(CColors.magenta80, CColors.magenta40, CColors.magenta60),
  purple(CColors.purple80, CColors.purple40, CColors.purple60),
  blue(CColors.blue80, CColors.blue40, CColors.blue60),
  cyan(CColors.cyan80, CColors.cyan40, CColors.cyan60),
  teal(CColors.teal80, CColors.teal40, CColors.teal60),
  green(CColors.green80, CColors.green40, CColors.green60),
  gray(CColors.gray80, CColors.gray40, CColors.gray60),
  coolGray(CColors.coolGray80, CColors.coolGray40, CColors.coolGray60),
  warmGray(CColors.warmGray80, CColors.warmGray40, CColors.warmGray60),
  highContrast(CColors.white0, CColors.black100, CColors.gray60),
  disabled(CColors.gray60, CColors.gray10, CColors.gray60);

  final Color textColor;
  final Color backgroundColor;
  final Color hoverColor;

  const CTagColors(this.textColor, this.backgroundColor, this.hoverColor);
}
