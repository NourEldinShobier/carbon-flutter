import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carbon/shared/index.dart';

class CSVGIcon extends StatelessWidget implements CWidget {
  final bool _enable;

  final double? width;
  final double? height;
  final Color? color;
  final Color? disableColor;
  final SvgPicture svgPicture;

  CSVGIcon.asset(
    String src, {
    Key? key,
    bool enable = true,
    this.width,
    this.height,
    this.color,
    this.disableColor,
    String? package,
  })  : svgPicture = SvgPicture.asset(
          src,
          height: height,
          width: width,
          color: enable ? color : disableColor,
          package: package,
        ),
        _enable = enable,
        super(key: key);

  @override
  bool get enable => _enable;

  @override
  Widget build(BuildContext context) {
    return svgPicture;
  }
}
