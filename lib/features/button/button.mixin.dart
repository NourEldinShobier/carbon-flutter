part of 'button.widget.dart';

mixin _CButtonStateBase<T extends _CButtonBase> on State<T> {
  late CButtonKind kind;
  late Size size;

  String state = enumToString(CWidgetState.enabled);

  bool focused = false;

  bool isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void evaluateStateVariables() {
    if (!isEnabled()) {
      state = enumToString(CWidgetState.disabled);
    } else if (isEnabled() && focused) {
      state = enumToString(CWidgetState.focus);
    } else {
      state = enumToString(CWidgetState.enabled);
    }

    kind = widget.props.kind;
    size = CButtonStyles.size[widget.props.size]!;
  }
}
