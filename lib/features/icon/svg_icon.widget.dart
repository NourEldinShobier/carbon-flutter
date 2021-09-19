import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carbon/features/enable/index.dart';

import 'icon.enum.dart';
import 'models/index.dart';

class CSVGIcon extends StatelessWidget {
  CSVGIcon.asset(
    String src, {
    Key? key,
    String? package,
    this.enable = true,
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

  final bool enable;
  final double? width;
  final double? height;
  final Color? color;
  final Color? disableColor;

  final bool matchTextDirection;
  final bool allowDrawingOutsideViewBox;
  final bool excludeFromSemantics;
  final bool cacheColorFilter;
  final BoxFit fit;
  final Alignment alignment;
  final WidgetBuilder? placeholderBuilder;
  final BlendMode colorBlendMode;
  final String? semanticsLabel;
  final Clip clipBehavior;

  final CSvgIconSource _source;
  final CSvgIconType _type;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? enable : false;
  }

  @override
  Widget build(BuildContext context) {
    if (_type == CSvgIconType.asset) {
      final source = _source as CSvgAssetIconSource;

      return SvgPicture.asset(
        source.src,
        key: key,
        color: _isEnabled(context) ? color : disableColor,
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
        color: _isEnabled(context) ? color : disableColor,
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
        color: _isEnabled(context) ? color : disableColor,
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
        color: _isEnabled(context) ? color : disableColor,
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
        color: _isEnabled(context) ? color : disableColor,
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
