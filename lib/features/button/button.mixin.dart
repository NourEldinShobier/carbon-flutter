part of 'button.widget.dart';

typedef _Styles = CButtonStyles;

mixin _CButtonStateBase<T extends _CButtonBase> on State<T> {
  late CButtonKind kind;
  late Size dimensions;

  CWidgetState state = CWidgetState.enabled;

  bool focused = false;

  bool get isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _setStateVariables() {
    if (!isEnabled) {
      state = CWidgetState.disabled;
    } else if (isEnabled && focused) {
      state = CWidgetState.focused;
    } else {
      state = CWidgetState.enabled;
    }

    kind = widget.props.kind;
    dimensions = _Styles.dimensions[widget.props.size]!;
  }
}
