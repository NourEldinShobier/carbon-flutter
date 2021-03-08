import 'package:lab/carbon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text-field.styles.dart';

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
  final CValidationResult Function(String value) validator;

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  var _status = CValidationResultType.primary;
  var _state = CWidgetState.enabled;

  var _focused = false;

  FocusNode _focusNode;
  CValidationResult _validationResult;
  String _value;

  void focusNodeListener() {
    if (_focused != _focusNode.hasFocus) {
      setState(() => _focused = this._focusNode.hasFocus);
    }
  }

  @override
  void initState() {
    if (widget.focusNode != null) {
      this._focusNode = widget.focusNode;
    } else {
      this._focusNode = FocusNode();
    }
    this._focusNode.addListener(focusNodeListener);
    super.initState();
  }

  @override
  void didUpdateWidget(CTextField oldWidget) {
    if (widget.readOnly) _focusNode.unfocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    this._focusNode.addListener(focusNodeListener);
    super.dispose();
  }

  /// validator is responsible for determining the [_status] of the widget.

  void validator(String text) {
    CValidationResultType st;
    _validationResult = widget.validator(text);

    if (_validationResult == null || _validationResult.type == CValidationResultType.primary) {
      st = CValidationResultType.primary;
    } else {
      if (_validationResult.type == CValidationResultType.success) {
        st = CValidationResultType.success;
      } else if (_validationResult.type == CValidationResultType.warning) {
        st = CValidationResultType.warning;
      } else if (_validationResult.type == CValidationResultType.error) {
        st = CValidationResultType.error;
      }
    }

    if (_status != st) setState(() => _status = st);
  }

  Widget build(BuildContext context) {
    final layout = cTextFieldLayout;
    const colors = cTextFieldG100;

    /// NOTE: this line doesn't make the widget build twice when [onChange] is
    /// called, because the [validator] calls [setState] when [st != _state].

    if (widget.validator != null && _value != null) validator(_value);

    /// determine the [_state] of the widget.

    if (!widget.enabled) {
      _focusNode.unfocus();
      _state = CWidgetState.disabled;
      _validationResult = null;
    } else if (widget.enabled && _focused) {
      _state = CWidgetState.focus;
    } else if (widget.enabled && _validationResult != null) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    final status = enumToString(_status);
    final state = enumToString(_state);

    final style = 'textfield-$status-$state';
    final cform = context.cform;

    var cformType = '';

    if (cform != null) {
      if (cform.widget.type == CFormType.modal)
        cformType = 'modalform-';
      else
        cformType = '';
    }

    return IgnorePointer(
      ignoring: !widget.enabled || widget.readOnly,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null) ...[
            CText(
              data: widget.label,
              isRequired: widget.isRequired,
              style: TextStyle(
                fontSize: layout['textfield-label-font-size'],
                fontFamily: layout['textfield-label-font-family'],
                color: colors['$style-label-color'],
              ),
            ),
            const SizedBox(height: 8)
          ],
          SizedBox(
            height: 44,
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
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
              onChanged: (String value) {
                _value = value;
                if (widget.validator != null) validator(value);
                widget.onChanged(value);
              },
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
              inputFormatters: widget.inputFormatters,
              cursorColor: colors['textfield-cursor-color'],
              keyboardAppearance: widget.keyboardAppearance,
              onTap: widget.onTap,
              scrollController: widget.scrollController,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              style: TextStyle(
                fontSize: layout['textfield-text-font-size'],
                fontFamily: layout['textfield-text-font-family'],
                color: colors['$style-text-color'],
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: 14,
                  bottom: widget.enabled
                      ? _focusNode.hasFocus
                          ? 13.5
                          : 14.5
                      : 14,
                ),
                fillColor: colors['textfield-$cformType$state-background-color'],
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: layout['textfield-hint-font-size'],
                  fontFamily: layout['textfield-hint-font-family'],
                  color: colors['$style-hint-color'],
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 46,
                  maxWidth: 46,
                ), // 44 + 2 (width of border)
                suffixIconConstraints: BoxConstraints(
                  minWidth: 46,
                  maxWidth: 46,
                ), // 44 + 2 (width of border)
                prefixIcon: widget.enabled
                    ? widget.prefixIcon
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          colors['textfield-disabled-icon-color'],
                          BlendMode.color,
                        ),
                        child: widget.prefixIcon,
                      ),
                suffixIcon: widget.enabled
                    ? _validationResult == null
                        ? widget.suffixIcon
                        : _validationResult.icon == null
                            ? widget.suffixIcon
                            : _validationResult.icon
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          colors['textfield-disabled-icon-color'],
                          BlendMode.color,
                        ),
                        child: widget.suffixIcon,
                      ),
                border: layout['$style-border'],
                enabledBorder: layout['$style-border'],
                focusedBorder: layout['$style-border'],
              ),
            ),
          ),
          if (widget.description != null) ...[
            const SizedBox(height: 8),
            CText(
              data: _validationResult == null ? widget.description : _validationResult.message,
              style: TextStyle(
                fontSize: layout['textfield-description-font-size'],
                fontFamily: layout['textfield-description-font-family'],
                color: colors['$style-description-color'],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
