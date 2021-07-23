import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carbon/features/enable/index.dart';

import 'enums/index.dart';
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
        _props = CSvgAssetIconProps(src, package),
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
        _props = CSvgNetworkIconProps(src, headers),
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
        _props = CSvgFileIconProps(file),
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
        _props = CSvgMemoryIconProps(bytes),
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
        _props = CSvgStringIconProps(bytes),
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

  final CSvgIconProps _props;
  final CSvgIconType _type;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? enable : false;
  }

  @override
  Widget build(BuildContext context) {
    if (_type == CSvgIconType.asset) {
      final props = _props as CSvgAssetIconProps;

      return SvgPicture.asset(
        props.src,
        key: key,
        color: _isEnabled(context) ? color : disableColor,
        width: width,
        height: height,
        package: props.package,
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
      final props = _props as CSvgNetworkIconProps;

      return SvgPicture.network(
        props.src,
        key: key,
        color: _isEnabled(context) ? color : disableColor,
        width: width,
        height: height,
        headers: props.headers,
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
      final props = _props as CSvgFileIconProps;

      return SvgPicture.file(
        props.file,
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
      final props = _props as CSvgMemoryIconProps;

      return SvgPicture.memory(
        props.bytes,
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
      final props = _props as CSvgStringIconProps;

      return SvgPicture.string(
        props.bytes,
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
