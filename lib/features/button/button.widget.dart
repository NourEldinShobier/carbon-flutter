import 'package:carbon_flutter/features/inherited_styles/index.dart';
import 'package:flutter/widgets.dart';

import 'package:carbon_flutter/shared/index.dart';
import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'button.props.dart';
import 'button.styles.dart';

part 'button.mixin.dart';

enum CButtonKind { primary, secondary, danger, tertiary, ghost }

enum CButtonSize { regular, sm, md }

enum CButtonType { regular, icon }

/// Buttons are clickable elements that are used to trigger actions.
/// They communicate calls to action to the user and allow users to interact
/// with pages in a variety of ways. Button labels express what action will
/// occur when the user interacts with it.
class CButton extends StatefulWidget {
  CButton({
    Key? key,
    required String label,
    required VoidCallback onTap,
    double labelSize = 14,
    bool enable = true,
    bool expand = false,
    CButtonKind kind = CButtonKind.primary,
    CButtonSize size = CButtonSize.regular,
    Widget? icon,
  })  : type = CButtonType.regular,
        props = CButtonRegularProps(
          icon: icon,
          expand: expand,
          label: label,
          labelSize: labelSize,
          enable: enable,
          kind: kind,
          size: size,
          onTap: onTap,
        ),
        super(key: key);

  CButton.icon({
    Key? key,
    bool enable = true,
    required Widget icon,
    required VoidCallback onTap,
    CButtonKind kind = CButtonKind.primary,
    CButtonSize size = CButtonSize.regular,
  })  : type = CButtonType.icon,
        props = CButtonIconOnlyProps(
          enable: enable,
          icon: icon,
          onTap: onTap,
          kind: kind,
          size: size,
        ),
        super(key: key);

  final CButtonBaseProps props;
  final CButtonType type;

  @override
  CButtonState createState() => CButtonState();
}

class CButtonState extends State<CButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == CButtonType.icon) {
      return _CButtonIconOnly(props: widget.props as CButtonIconOnlyProps);
    }

    return _CButtonRegular(props: widget.props as CButtonRegularProps);
  }
}

//

abstract class _CButtonBase extends StatefulWidget {
  CButtonBaseProps get props;
}

//

class _CButtonRegular extends _CButtonBase {
  _CButtonRegular({required this.props});

  @override
  final CButtonRegularProps props;

  @override
  _CButtonRegularState createState() => _CButtonRegularState();
}

class _CButtonRegularState extends State<_CButtonRegular>
    with _CButtonStateBase {
  List<Widget> _buildTrailing() {
    final result = <Widget>[];

    /// determine the [Sizedbox] width

    if (widget.props.expand) {
      result.add(const Expanded(child: SizedBox()));
    } else if (widget.props.kind == CButtonKind.ghost) {
      if (widget.props.icon != null) {
        result.add(const SizedBox(width: 8));
      }
    } else if (widget.props.icon != null) {
      result.add(const SizedBox(width: 32));
    } else {
      result.add(const SizedBox(width: 64));
    }

    /// add button icon

    if (widget.props.icon != null) {
      result.add(widget.props.icon!);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return CInheritedStyles(
      styles: {'button-content-color': _Styles.contentColor[kind]![state]!},
      child: CEnable(
        value: isEnabled,
        child: IgnorePointer(
          ignoring: !isEnabled,
          child: GestureDetector(
            onTap: widget.props.onTap,
            onTapDown: (_) => setState(() => focused = true),
            onTapUp: (_) => setState(() => focused = false),
            onTapCancel: () => setState(() => focused = false),
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedContainer(
                    height: dimensions.height,
                    duration: _Styles.backgroundColorAnimation['duration'],
                    curve: _Styles.backgroundColorAnimation['curve'],
                    decoration: BoxDecoration(
                        color: _Styles
                            .backgroundColor[widget.props.kind]![state]!),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedContainer(
                    height: dimensions.height,
                    duration: _Styles.firstBorderAnimation[kind]!['duration'],
                    curve: _Styles.firstBorderAnimation[kind]!['curve'],
                    decoration: BoxDecoration(
                        border: _Styles.firstBorder[kind]![state]!),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedContainer(
                    height: dimensions.height,
                    duration: _Styles.secondBorderAnimation['duration'],
                    curve: _Styles.secondBorderAnimation['curve'],
                    decoration: BoxDecoration(
                        border: _Styles.secondBorder[kind]![state]!),
                  ),
                ),
                SizedBox(
                  height: dimensions.height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _Styles.padding[widget.props.size]!),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CText(
                          data: widget.props.label,
                          style: TextStyle(
                            fontSize: widget.props.labelSize,
                            color: _Styles.contentColor[kind]![state]!,
                          ),
                        ),
                        ..._buildTrailing()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//

class _CButtonIconOnly extends _CButtonBase {
  _CButtonIconOnly({required this.props});

  @override
  final CButtonIconOnlyProps props;

  @override
  _CButtonIconOnlyState createState() => _CButtonIconOnlyState();
}

class _CButtonIconOnlyState extends State<_CButtonIconOnly>
    with _CButtonStateBase {
  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return CInheritedStyles(
      styles: {'button-content-color': _Styles.contentColor[kind]![state]!},
      child: CEnable(
        value: isEnabled,
        child: IgnorePointer(
          ignoring: !isEnabled,
          child: GestureDetector(
            onTap: widget.props.onTap,
            onTapDown: (_) => setState(() => focused = true),
            onTapUp: (_) => setState(() => focused = false),
            onTapCancel: () => setState(() => focused = false),
            child: Stack(
              children: [
                AnimatedContainer(
                  width: dimensions.width,
                  height: dimensions.height,
                  duration: _Styles.backgroundColorAnimation['duration'],
                  curve: _Styles.backgroundColorAnimation['curve'],
                  decoration: BoxDecoration(
                      color:
                          _Styles.backgroundColor[widget.props.kind]![state]!),
                ),
                AnimatedContainer(
                  width: dimensions.width,
                  height: dimensions.height,
                  duration: _Styles.firstBorderAnimation[kind]!['duration'],
                  curve: _Styles.firstBorderAnimation[kind]!['curve'],
                  decoration:
                      BoxDecoration(border: _Styles.firstBorder[kind]![state]!),
                ),
                AnimatedContainer(
                  width: dimensions.width,
                  height: dimensions.height,
                  duration: _Styles.secondBorderAnimation['duration'],
                  curve: _Styles.secondBorderAnimation['curve'],
                  decoration: BoxDecoration(
                      border: _Styles.secondBorder[kind]![state]!),
                ),
                SizedBox(
                  width: dimensions.width,
                  height: dimensions.height,
                  child: Align(
                      alignment: Alignment.center, child: widget.props.icon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
