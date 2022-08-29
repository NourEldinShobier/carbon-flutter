import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

class CText extends StatelessWidget {
  const CText({
    Key? key,
    required this.data,
    this.enable = true,
    this.isRequired = false,
    this.style,
    this.disableStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  /// The text to display.
  final String data;

  /// If required, the text will be followed by red *.
  final bool isRequired;

  /// Whether the text widget is enabled.
  final bool enable;

  /// The style to use for this text.
  final TextStyle? style;

  /// The style to use for this text when [enable] is `false`.
  final TextStyle? disableStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  final int? maxLines;

  /// An alternative semantics label for this text.
  final String? semanticsLabel;

  /// {@macro flutter.dart:ui.textHeightBehavior}
  final TextHeightBehavior? textHeightBehavior;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  TextStyle? _textStyle(BuildContext context) {
    return _isEnabled(context) ? style : disableStyle;
  }

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? enable : false;
  }

  Widget _buildText(BuildContext context) {
    return Text(
      data,
      style: _textStyle(context)?.merge(
        TextStyle(
          fontFamilyFallback: [
            if (style!.fontFamilyFallback != null) ...style!.fontFamilyFallback!,
            'packages/carbon_flutter/${style!.fontFamily ?? CFonts.primaryRegular}',
          ],
        ),
      ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: _buildText(context)),
          Flexible(child: CText(data: ' *', style: TextStyle(color: CColors.red60))),
        ],
      );
    }

    return _buildText(context);
  }
}
