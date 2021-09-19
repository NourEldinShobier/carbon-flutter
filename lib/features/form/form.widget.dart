import 'package:flutter/widgets.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/shared/index.dart';

import 'form.enum.dart';
import 'form.style.dart';

class CForm extends StatefulWidget {
  CForm({
    Key? key,
    required this.children,
    this.enable = true,
    this.actions,
    this.type = CFormType.blank,
  }) : super(key: key);

  final bool enable;
  final List<Widget> children;
  final CFormType type;
  final Widget? actions;

  @override
  CFormState createState() => CFormState();

  static CFormState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InteritedCForm>()?.state;
  }
}

class CFormState extends State<CForm> {
  final _layouts = CFormStyle.layouts;
  final _colors = CFormStyle.colors;

  /// styles helpers
  String _cwidget = 'form';
  String _state = enumToString(CWidgetState.enabled);
  String _type = '';

  CFormType get type => widget.type;

  bool _isEnabled() {
    return context.inheritedEnable ? widget.enable : false;
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_isEnabled()) {
      _state = enumToString(CWidgetState.disabled);
    } else {
      _state = enumToString(CWidgetState.enabled);
    }

    _type = enumToString(type);
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return CEnable(
      value: _isEnabled(),
      child: IgnorePointer(
        ignoring: !_isEnabled(),
        child: _InteritedCForm(
          state: this,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: _colors['$_cwidget-$_type-$_state-background-color'],
                padding: _layouts['$_cwidget-$_type-padding'],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children,
                ),
              ),
              if (widget.actions != null) widget.actions!,
            ],
          ),
        ),
      ),
    );
  }
}

class _InteritedCForm extends InheritedWidget {
  const _InteritedCForm({Key? key, this.state, required Widget child}) : super(key: key, child: child);

  final CFormState? state;

  @override
  bool updateShouldNotify(oldWidget) => true;
}
