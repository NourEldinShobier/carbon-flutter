import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carbon/shared/index.dart';
import 'package:carbon/features/form/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/enable/index.dart';

import 'text_field.styles.dart';

class CTextField extends StatefulWidget {
  const CTextField({
    Key? key,
    this.enable = true,
    this.validator,
    this.label,
    this.hint,
    this.description,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
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

  final bool enable;

  final String? label;
  final String? hint;
  final String? description;
  final String obscuringCharacter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool isRequired;
  final bool obscureText;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final ToolbarOptions? toolbarOptions;
  final Brightness? keyboardAppearance;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;

  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final CValidationResult? Function(String? value)? validator;

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  final layouts = CTextfieldStyle.layouts;
  final colors = CTextfieldStyle.colors;

  /// styles helpers
  late String type, state, selector, cformType;

  var _state = CWidgetState.enabled;

  var _focused = false;

  late FocusNode _focusNode;
  CValidationResult? _validationResult;
  CValidationResultType? _status;
  String? _value;

  void _focusNodeListener() {
    if (_focused != _focusNode.hasFocus) {
      setState(() => _focused = this._focusNode.hasFocus);
    }
  }

  @override
  void initState() {
    if (widget.focusNode != null) {
      this._focusNode = widget.focusNode!;
    } else {
      this._focusNode = FocusNode();
    }
    this._focusNode.addListener(_focusNodeListener);
    super.initState();
  }

  @override
  void didUpdateWidget(CTextField oldWidget) {
    if (widget.readOnly) _focusNode.unfocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    this._focusNode.addListener(_focusNodeListener);
    super.dispose();
  }

  bool _isEnabled() {
    return context.inheritedEnable ? widget.enable : false;
  }

  /// validator is responsible for determining the [_status] of the widget.

  void _validator(String? text) {
    CValidationResultType? st;
    _validationResult = widget.validator!(text);

    if (_validationResult == null) {
      st = null;
    } else {
      if (_validationResult!.type == CValidationResultType.success) {
        st = CValidationResultType.success;
      } else if (_validationResult!.type == CValidationResultType.warning) {
        st = CValidationResultType.warning;
      } else if (_validationResult!.type == CValidationResultType.error) {
        st = CValidationResultType.error;
      }
    }

    if (_status != st) setState(() => _status = st);
  }

  void _evaluateStateVariables() {
    final cform = context.cform;

    /// NOTE: this line doesn't make the widget build twice when [onChange] is
    /// called, because the [validator] calls [setState] when [st != _state].

    if (widget.validator != null && _value != null) _validator(_value);

    /// determine the [_state] of the widget.

    if (!widget.enable) {
      _focusNode.unfocus();
      _state = CWidgetState.disabled;
      _validationResult = null;
    } else if (widget.enable && _focused) {
      _state = CWidgetState.focus;
    } else if (widget.enable && _validationResult != null) {
      _state = CWidgetState.focus;
    } else {
      _state = CWidgetState.enabled;
    }

    type = enumToString(_status ?? 'primary');
    state = enumToString(_state);

    selector = 'textfield-$type-$state';

    if (cform != null) {
      cformType = cform.type == CFormType.blank ? 'blankform-' : '';
    } else {
      cformType = '';
    }
  }

  Widget build(BuildContext context) {
    final isEnabled = _isEnabled();

    _evaluateStateVariables();

    return IgnorePointer(
      ignoring: !isEnabled || widget.readOnly,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null) ...[
            CText(
              data: widget.label!,
              isRequired: widget.isRequired,
              style: TextStyle(
                fontSize: layouts['textfield-label-font-size'],
                fontFamily: layouts['textfield-label-font-family'],
                color: colors['$selector-label-color'],
              ),
            ),
            const SizedBox(height: 8)
          ],
          SizedBox(
            height: 40,
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
                if (widget.validator != null) _validator(value);
                widget.onChanged?.call(value);
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
                fontSize: layouts['textfield-text-font-size'],
                fontFamily: layouts['textfield-text-font-family'],
                color: colors['$selector-text-color'],
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: 14,
                  top: isEnabled && _focusNode.hasFocus ? 8 : 8,
                  bottom: isEnabled
                      ? _focusNode.hasFocus
                          ? 12.5
                          : 15
                      : 15,
                ),
                fillColor: colors['textfield-$cformType$state-background-color'],
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: layouts['textfield-hint-font-size'],
                  fontFamily: layouts['textfield-hint-font-family'],
                  color: colors['$selector-hint-color'],
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 46,
                  maxWidth: 46,
                ), // 44 + 2 (width of border)
                suffixIconConstraints: BoxConstraints(
                  minWidth: 46,
                  maxWidth: 46,
                ), // 44 + 2 (width of border)
                prefixIcon: isEnabled
                    ? widget.prefixIcon
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          colors['textfield-disabled-icon-color']!,
                          BlendMode.color,
                        ),
                        child: widget.prefixIcon,
                      ),
                suffixIcon: isEnabled
                    ? _validationResult == null
                        ? widget.suffixIcon
                        : _validationResult!.icon == null
                            ? widget.suffixIcon
                            : _validationResult!.icon
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          colors['textfield-disabled-icon-color']!,
                          BlendMode.color,
                        ),
                        child: widget.suffixIcon,
                      ),
                border: layouts['$selector-border'],
                enabledBorder: layouts['$selector-border'],
                focusedBorder: layouts['$selector-border'],
              ),
            ),
          ),
          if (widget.description != null) ...[
            const SizedBox(height: 8),
            CText(
              data: _validationResult == null ? widget.description! : _validationResult!.message,
              style: TextStyle(
                fontSize: layouts['textfield-description-font-size'],
                fontFamily: layouts['textfield-description-font-family'],
                color: colors['$selector-description-color'],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
