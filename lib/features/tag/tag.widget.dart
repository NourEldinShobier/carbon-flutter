import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CTag extends StatelessWidget {
  CTag({
    super.key,
    required String label,
    bool disabled = false,
    bool filter = false,
    CTagColors color = CTagColors.red,
    CTagSize size = CTagSize.md,
    this.onFilterPress,
  }) : props = CTagProps(
          disabled: disabled,
          label: label,
          filter: filter,
          color: color,
          size: size,
        );

  CTag.filter({
    super.key,
    required String label,
    this.onFilterPress,
    bool disabled = false,
    CTagColors color = CTagColors.red,
    CTagSize size = CTagSize.md,
  }) : props = CTagProps(
          disabled: disabled,
          label: label,
          filter: true,
          color: color,
          size: size,
        );

  /// {@macro tag_props}
  final CTagProps props;

  /// the callback when the filter icon is pressed
  final VoidCallback? onFilterPress;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        clipBehavior: Clip.antiAlias,
        height: props.size == CTagSize.sm ? 20 : 28,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: props.color.backgroundColor,
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: props.filter
                  ? EdgeInsets.only(left: 8, right: 2)
                  : EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                props.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: props.color.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            props.filter
                ? _CTagFilter(
                    color: props.color,
                    disabled: props.disabled,
                    onPress: onFilterPress ?? () {},
                    size: props.size,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _CTagFilter extends StatefulWidget {
  const _CTagFilter({
    required this.disabled,
    required this.color,
    required this.onPress,
    required this.size,
  });

  final bool disabled;
  final CTagColors color;
  final VoidCallback onPress;
  final CTagSize size;

  @override
  State<_CTagFilter> createState() => _CTagFilterState();
}

class _CTagFilterState extends State<_CTagFilter> {
  bool isHovered = false;
  bool isPressed = false;

  Color containerColor() {
    if (widget.disabled) return CColors.gray20;

    return isPressed //
        ? widget.color.hoverColor
        : widget.color.backgroundColor;
  }

  Color iconColor() => widget.disabled //
      ? CColors.gray50
      : widget.color.textColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: !widget.disabled,
      child: MouseRegion(
        onHover: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.disabled ? null : widget.onPress,
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) => setState(() => isPressed = false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: ShapeDecoration(
              color: containerColor(),
              shape: const StadiumBorder(),
            ),
            child: Padding(
              padding: widget.size == CTagSize.sm
                  ? EdgeInsets.zero
                  : const EdgeInsets.all(2),
              child: Icon(
                CIcons.close,
                size: widget.size == CTagSize.sm ? 18 : 20,
                color: iconColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
