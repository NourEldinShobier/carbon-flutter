part of 'button.widget.dart';

mixin _CButtonStateBase<T extends _CButtonBase> on State<T> {
  late Color contentColor;
  late Color backgroundColor;
  late CButtonKind kind;
  late Size size;
  late Border firstBorder;
  late Border secondBorder;

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
    contentColor = CButtonStyles.contentColor[kind]![state]!;
    backgroundColor = CButtonStyles.backgroundColor[widget.props.kind]![state]!;

    firstBorder = CButtonStyles.firstBorder[kind]![state]!;
    secondBorder = CButtonStyles.secondBorder[kind]![state]!;
  }
}
