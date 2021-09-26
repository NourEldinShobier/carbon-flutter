import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/enable/index.dart';

class CText extends StatelessWidget {
  const CText({
    Key? key,
    required this.data,
    this.enable = true,
    this.isRequired = false,
    this.textSpan,
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

  final String data;
  final bool isRequired;
  final bool enable;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final TextStyle? disableStyle;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

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
            'packages/carbon/${style!.fontFamily ?? CFonts.primaryRegular}',
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
