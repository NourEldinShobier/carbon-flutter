import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab/carbon.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

export './text-field.styles.dart';

class CTextField extends StatefulWidget {
  const CTextField({
    Key key,
    this.validator,
    this.label,
    this.hint,
    this.description,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onEditingComplete,
    this.onChanged,
    this.onSubmitted,
    this.obscuringCharacter = '•',
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.toolbarOptions,
    this.keyboardAppearance,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.inputFormatters,
    this.isRequired = false,
  }) : super(key: key);

  final String label;
  final String hint;
  final String description;
  final String obscuringCharacter;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool isRequired;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool showCursor;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final int maxLines;
  final int minLines;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextCapitalization textCapitalization;
  final TextDirection textDirection;
  final ToolbarOptions toolbarOptions;
  final Brightness keyboardAppearance;
  final ScrollController scrollController;
  final ScrollPhysics scrollPhysics;

  final Iterable<String> autofillHints;
  final List<TextInputFormatter> inputFormatters;

  final void Function() onTap;
  final void Function() onEditingComplete;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final CValidationResultType Function(String value) validator;

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  var _status = CWidgetStatus.primary;
  var _state = CWidgetState.enabled;

  FocusNode focusNode;

  // update _status and sate on didupdate
  // flutter focusnode remove focus if enabled is false or dont assign focusnode to textfield
  // or may be the absorberwont allow focus
  // but what if it was focused the disabled (via text changed or on submint...etc)

  void focusNodeListener() {
    setState(() {
      var focused = this.focusNode.hasFocus;
      _state = focused ? CWidgetState.focus : CWidgetState.enabled;
    });
    // TODO: in this set state you should update status and state
    // TODO: update state whe enabled changes
  }

  @override
  void initState() {
    if (widget.focusNode != null) {
      this.focusNode = widget.focusNode;
    } else {
      this.focusNode = FocusNode();
    }
    this.focusNode.addListener(focusNodeListener);
    super.initState();
  }

  @override
  void didUpdateWidget(CTextField oldWidget) {
    if (!widget.enabled) {
      _state = CWidgetState.disabled;
      focusNode.unfocus();
    } else {
      _state = CWidgetState.enabled;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    this.focusNode.addListener(focusNodeListener);
    super.dispose();
  }

  void validator(String text) {
    /* if (widget.validator == null) return null;

    final status = enumToString(_status);

    String error = widget.props['validator'](text);
    CWidgetStatus st;

    if (error == null)
      st = CWidgetStatus.primary;
    else
      st = CWidgetStatus.danger;

    if (st != status) {
      setState(() => status = st);
    }

    return error; */
  }

  Widget build(BuildContext context) {
    final carbon = context.style;

    final status = enumToString(_status);
    final state = enumToString(_state);

    final style = 'textfield-$status-$state';

    // add absorber based on enabled
    // when enabled = false, 1) remove focus, 2) keep focus is disabled
    // add disabled, and detect disabled (state)
    // if read only true, focus node?
    // if you will use keepfocus, you need to copy focus node
    // add ions (trailing, leading)
    // custom toolbar

    return IgnorePointer(
      ignoring: !widget.enabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null) ...[
            CText(
              data: widget.label,
              isRequired: widget.isRequired,
              style: TextStyle(
                fontSize: carbon.get('textfield-label-font-size'),
                fontFamily: carbon.get('textfield-label-font-family'),
                color: carbon.get('$style-label-color'),
              ),
            ),
            const SizedBox(height: 8)
          ],
          SizedBox(
            height: 40,
            child: TextField(
              controller: widget.controller,
              focusNode: focusNode,
              keyboardType: widget.keyboardType,
              textCapitalization: widget.textCapitalization,
              textAlignVertical: TextAlignVertical.center,
              textDirection: widget.textDirection,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              autofocus: widget.autofocus,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              enableSuggestions: widget.enableSuggestions,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              onChanged: (String value) {
                if (widget.validator != null) validator(value);
                widget.onChanged(value);
              },
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
              inputFormatters: widget.inputFormatters,
              cursorColor: carbon.get('textfield-cursor-color'),
              keyboardAppearance: widget.keyboardAppearance,
              onTap: widget.onTap,
              scrollController: widget.scrollController,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              style: TextStyle(
                color: carbon.get('$style-text-color'),
                fontSize: carbon.get('textfield-text-font-size'),
                fontFamily: carbon.get('textfield-text-font-family'),
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: padding(left: 16, right: 16, bottom: 16),
                fillColor: carbon.get('$style-background-color'),
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: carbon.get('$style-hint-color'),
                  fontSize: carbon.get('textfield-hint-font-size'),
                  fontFamily: carbon.get('textfield-hint-font-family'),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 40, maxWidth: 40),
                suffixIconConstraints:
                    BoxConstraints(minWidth: 40, maxWidth: 40),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                border: carbon.get('$style-border'),
                enabledBorder: carbon.get('$style-border'),
                focusedBorder: carbon.get('$style-border'),
              ),
            ),
          ),
          if (widget.description != null) ...[
            const SizedBox(height: 8),
            CText(
              data: widget.description,
              style: TextStyle(
                fontSize: carbon.get('textfield-description-font-size'),
                fontFamily: carbon.get('textfield-description-font-family'),
                color: carbon.get('$style-description-color'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _XTextFieldErrorIcon extends StatelessWidget {
  const _XTextFieldErrorIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/error.svg', height: 16);
  }
}
