import 'package:flutter/widgets.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/features/inherited_styles/index.dart';
import 'package:carbon/shared/index.dart';

import 'form.props.dart';
import 'form.styles.dart';

enum CFormType { group, blank }

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
  CWidgetState _state = CWidgetState.enabled;
  CFormType _type = CFormType.blank;

  CFormType get type => widget.props.type;

  bool _isEnabled() {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _evaluateStateVariables() {
    if (!_isEnabled()) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }

    _type = type;
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return CInheritedStyles(
      styles: {
        'textfield-background-color': CFormStyles.textfieldBackgroundColor[_type],
      },
      child: CEnable(
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
                  color: CFormStyles.backgroundColor[_type]![_state],
                  padding: CFormStyles.padding[_type],
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
