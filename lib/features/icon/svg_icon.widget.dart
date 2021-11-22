import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/features/inherited_styles/index.dart';

import 'icon.enum.dart';
import 'models/index.dart';

/// A widget that will parse SVG data into an icon.
class CSVGIcon extends StatelessWidget {
  CSVGIcon.asset(
    String src, {
    Key? key,
    String? package,
    this.enable = true,
    this.inheritStyles = true,
    this.width,
    this.height,
    this.color,
    this.disableColor,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.excludeFromSemantics = false,
    this.cacheColorFilter = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.clipBehavior = Clip.hardEdge,
  })  : _type = CSvgIconType.asset,
        _source = CSvgAssetIconSource(src, package),
        super(key: key);

  CSVGIcon.network(
    String src, {
    Key? key,
    Map<String, String>? headers,
    this.enable = true,
    this.inheritStyles = true,
    this.width,
    this.height,
    this.color,
    this.disableColor,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.excludeFromSemantics = false,
    this.cacheColorFilter = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.clipBehavior = Clip.hardEdge,
  })  : _type = CSvgIconType.network,
        _source = CSvgNetworkIconSource(src, headers),
        super(key: key);

  CSVGIcon.file(
    File file, {
    Key? key,
    this.enable = true,
    this.inheritStyles = true,
    this.width,
    this.height,
    this.color,
    this.disableColor,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.excludeFromSemantics = false,
    this.cacheColorFilter = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.clipBehavior = Clip.hardEdge,
  })  : _type = CSvgIconType.file,
        _source = CSvgFileIconSource(file),
        super(key: key);

  CSVGIcon.memory(
    Uint8List bytes, {
    Key? key,
    this.enable = true,
    this.inheritStyles = true,
    this.width,
    this.height,
    this.color,
    this.disableColor,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.excludeFromSemantics = false,
    this.cacheColorFilter = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.clipBehavior = Clip.hardEdge,
  })  : _type = CSvgIconType.memory,
        _source = CSvgMemoryIconSource(bytes),
        super(key: key);

  CSVGIcon.string(
    String bytes, {
    Key? key,
    this.enable = true,
    this.inheritStyles = true,
    this.width,
    this.height,
    this.color,
    this.disableColor,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.excludeFromSemantics = false,
    this.cacheColorFilter = false,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.clipBehavior = Clip.hardEdge,
  })  : _type = CSvgIconType.string,
        _source = CSvgStringIconSource(bytes),
        super(key: key);

  /// Whether the icon is enabled or not.
  final bool enable;

  /// Whether if the icon should inherit its styles from a [CInheritedStyles]
  /// widget or not.
  ///
  /// Such attribute comes handy if the icon styles are manipulated
  /// by a parent widget that maintans a [CInheritedStyles] within.
  final bool inheritStyles;

  /// If specified, the width to use for the SVG.  If unspecified, the SVG
  /// will take the width of its parent.
  final double? width;

  /// If specified, the height to use for the SVG.  If unspecified, the SVG
  /// will take the height of its parent.
  final double? height;

  /// The color to use when drawing the icon.
  final Color? color;

  /// The color to use when the icon is disabled.
  final Color? disableColor;

  /// If true, will horizontally flip the picture in [TextDirection.rtl] contexts.
  final bool matchTextDirection;

  /// If true, will allow the SVG to be drawn outside of the clip boundary of its
  /// viewBox.
  final bool allowDrawingOutsideViewBox;

  /// Whether to exclude this picture from semantics.
  ///
  /// Useful for pictures which do not contribute meaningful information to an
  /// application.
  final bool excludeFromSemantics;

  /// Whether to cache the picture with the [colorFilter] applied or not.
  ///
  /// This value should be set to true if the same SVG will be rendered with
  /// multiple colors, but false if it will always (or almost always) be
  /// rendered with the same [colorFilter].
  ///
  /// If [Svg.cacheColorFilterOverride] is not null, it will override this value
  /// for all widgets, regardless of what is specified for an individual widget.
  ///
  /// This defaults to false and must not be null.
  final bool cacheColorFilter;

  /// How to inscribe the picture into the space allocated during layout.
  /// The default is [BoxFit.contain].
  final BoxFit fit;

  /// How to align the picture within its parent widget.
  ///
  /// The alignment aligns the given position in the picture to the given position
  /// in the layout bounds. For example, an [Alignment] alignment of (-1.0,
  /// -1.0) aligns the image to the top-left corner of its layout bounds, while a
  /// [Alignment] alignment of (1.0, 1.0) aligns the bottom right of the
  /// picture with the bottom right corner of its layout bounds. Similarly, an
  /// alignment of (0.0, 1.0) aligns the bottom middle of the image with the
  /// middle of the bottom edge of its layout bounds.
  ///
  /// If the [alignment] is [TextDirection]-dependent (i.e. if it is a
  /// [AlignmentDirectional]), then a [TextDirection] must be available
  /// when the picture is painted.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final Alignment alignment;

  /// The placeholder to use while fetching, decoding, and parsing the SVG data.
  final WidgetBuilder? placeholderBuilder;

  /// The [Semantics.label] for this picture.
  ///
  /// The value indicates the purpose of the picture, and will be
  /// read out by screen readers.
  final String? semanticsLabel;

  /// The content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common
  /// use cases.
  ///
  /// Defaults to [Clip.hardEdge], and must not be null.
  final Clip clipBehavior;

  final BlendMode colorBlendMode;

  final CSvgIconSource _source;
  final CSvgIconType _type;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? enable : false;
  }

  Color? _color(BuildContext context) {
    final isEnabled = _isEnabled(context);

    if (inheritStyles) {
      if (isEnabled) {
        return context.styles['icon-enabled-color'] ?? color;
      }

      return context.styles['icon-disabled-color'] ?? disableColor;
    }

    return isEnabled ? color : disableColor;
  }

  @override
  Widget build(BuildContext context) {
    if (_type == CSvgIconType.asset) {
      final source = _source as CSvgAssetIconSource;

      return SvgPicture.asset(
        source.src,
        key: key,
        color: _color(context),
        width: width,
        height: height,
        package: source.package,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        excludeFromSemantics: excludeFromSemantics,
        cacheColorFilter: cacheColorFilter,
        fit: fit,
        alignment: alignment,
        placeholderBuilder: placeholderBuilder,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        clipBehavior: clipBehavior,
      );
    } else if (_type == CSvgIconType.network) {
      final source = _source as CSvgNetworkIconSource;

      return SvgPicture.network(
        source.src,
        key: key,
        color: _color(context),
        width: width,
        height: height,
        headers: source.headers,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        excludeFromSemantics: excludeFromSemantics,
        cacheColorFilter: cacheColorFilter,
        fit: fit,
        alignment: alignment,
        placeholderBuilder: placeholderBuilder,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        clipBehavior: clipBehavior,
      );
    } else if (_type == CSvgIconType.file) {
      final source = _source as CSvgFileIconSource;

      return SvgPicture.file(
        source.file,
        key: key,
        color: _color(context),
        width: width,
        height: height,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        excludeFromSemantics: excludeFromSemantics,
        cacheColorFilter: cacheColorFilter,
        fit: fit,
        alignment: alignment,
        placeholderBuilder: placeholderBuilder,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        clipBehavior: clipBehavior,
      );
    } else if (_type == CSvgIconType.memory) {
      final source = _source as CSvgMemoryIconSource;

      return SvgPicture.memory(
        source.bytes,
        key: key,
        color: _color(context),
        width: width,
        height: height,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        excludeFromSemantics: excludeFromSemantics,
        cacheColorFilter: cacheColorFilter,
        fit: fit,
        alignment: alignment,
        placeholderBuilder: placeholderBuilder,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        clipBehavior: clipBehavior,
      );
    } else if (_type == CSvgIconType.string) {
      final source = _source as CSvgStringIconSource;

      return SvgPicture.string(
        source.bytes,
        key: key,
        color: _color(context),
        width: width,
        height: height,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        excludeFromSemantics: excludeFromSemantics,
        cacheColorFilter: cacheColorFilter,
        fit: fit,
        alignment: alignment,
        placeholderBuilder: placeholderBuilder,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        clipBehavior: clipBehavior,
      );
    }

    throw ErrorWidget('carbon[CSVGIcon]: Unknown CSvgIconType is provided.');
  }
}
