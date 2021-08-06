part of 'button.widget.dart';

mixin _CButtonStateBase<T extends _CButtonBase> on State<T> {
  final colors = CButtonStyle.colors;
  final layouts = CButtonStyle.layouts;

  /// styles helpers
  String cwidget = 'button';
  String state = enumToString(CWidgetState.enabled);
  String kind = '';
  String size = '';

  bool focused = false;

  bool isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!isEnabled()) {
      state = enumToString(CWidgetState.disabled);
    } else if (isEnabled() && focused) {
      state = enumToString(CWidgetState.focus);
    } else {
      state = enumToString(CWidgetState.enabled);
    }

    kind = enumToString(widget.props.kind);
    size = enumToString(widget.props.size);
  }
}
