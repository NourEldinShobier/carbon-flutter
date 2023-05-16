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
  final CTagColors color;

  /// Creates a [CTagProps].
  const CTagProps({
    required this.disabled,
    required this.label,
    required this.filter,
    required this.color,
    required this.size,
  });
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
  red(CColors.red80, CColors.red40, CColors.red40),
  magenta(CColors.magenta80, CColors.magenta40, CColors.magenta40),
  purple(CColors.purple80, CColors.purple40, CColors.purple40),
  blue(CColors.blue80, CColors.blue40, CColors.blue40),
  cyan(CColors.cyan80, CColors.cyan40, CColors.cyan40),
  teal(CColors.teal80, CColors.teal40, CColors.teal40),
  green(CColors.green80, CColors.green40, CColors.green40),
  gray(CColors.gray80, CColors.gray40, CColors.gray40),
  coolGray(CColors.coolGray80, CColors.coolGray40, CColors.coolGray40),
  warmGray(CColors.warmGray80, CColors.warmGray40, CColors.warmGray40),
  highContrast(CColors.white0, CColors.black100, CColors.black100);

  final Color textColor;
  final Color backgroundColor;
  final Color hoverColor;

  const CTagColors(this.textColor, this.backgroundColor, this.hoverColor);
}
