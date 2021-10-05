import 'package:flutter/widgets.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/shared/index.dart';

import 'form.enum.dart';
import 'form.props.dart';
import 'form.style.dart';

/// A form is a group of related input controls that allows
/// users to provide data or configure options.
class CForm extends StatefulWidget {
  CForm({
    Key? key,
    required List<Widget> children,
    bool enable = true,
    Widget? action,
    CFormType type = CFormType.blank,
  })  : props = CFormProps(
          enable: enable,
          children: children,
          type: type,
          action: action,
        ),
        super(key: key);

  final CFormProps props;

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

  CFormType get type => widget.props.type;

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
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
                  children: widget.props.children,
                ),
              ),
              if (widget.props.action != null) widget.props.action!,
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
