part of 'button.widget.dart';

mixin _CButtonStateBase<T extends _CButtonBase> on State<T> {
  late CButtonKind kind;
  late Size size;

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
    size = CButtonStyles.size[widget.props.size]!;
  }
}
