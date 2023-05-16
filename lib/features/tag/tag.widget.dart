import 'index.dart';
import 'package:flutter/material.dart';

class CTag extends StatefulWidget {
  CTag({
    super.key,
    bool disabled = false,
    String label = '',
    bool filter = false,
    CTagColors color = CTagColors.red,
    CTagSize size = CTagSize.md,
  }) : props = CTagProps(
          disabled: disabled,
          label: label,
          filter: filter,
          color: color,
          size: size,
        );

  /// {@macro tag_props}
  final CTagProps props;

  @override
  State<CTag> createState() => _CTagState();
}

class _CTagState extends State<CTag> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(() => isHovered = value),
      child: IntrinsicWidth(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: isHovered
                ? widget.props.color.hoverColor
                : widget.props.color.backgroundColor,
            shape: const StadiumBorder(),
          ),
          height: widget.props.size == CTagSize.sm ? 18 : 24,
          width: null,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          alignment: Alignment.center,
          child: Text(
            widget.props.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.props.color.textColor,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
