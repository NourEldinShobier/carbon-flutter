import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carbon/shared/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/features/inherited_styles/index.dart';

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
  final _styles = CTextfieldStyle.styles;
  final _inheritedStyles = CTextfieldStyle.inheritedStyles;

  /// styles helpers
  CWidgetState _state = CWidgetState.enabled;
  String _status = 'primary';

  bool _focused = false;
  late FocusNode _focusNode;

  CValidationResult? _validationResult;
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

  bool get _isEnabled {
    return context.inheritedEnable ? widget.enable : false;
  }

  /// validator is responsible for determining the [_status] of the widget.

  void _validateInput(String? text) {
    _validationResult = widget.validator!(text);

    setState(() {
      _status = _validationResult == null ? 'primary' : enumToString(_validationResult);
    });
  }

  void _setStateVariables() {
    /// NOTE: this line doesn't make the widget build twice when [onChange] is
    /// called, because the [validator] calls [setState] when [st != _state].

    if (widget.validator != null && _value != null) _validateInput(_value);

    if (!widget.enable) {
      _focusNode.unfocus();
      _validationResult = null;
      _state = CWidgetState.disabled;
    } else if (widget.enable && _focused) {
      _state = CWidgetState.focused;
    } else if (widget.enable && _validationResult != null) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }
  }

  Widget build(BuildContext context) {
    final isEnabled = _isEnabled;

    ///TODO: handle textfield inherited background of form

    _setStateVariables();

    return CInheritedStyles(
      styles: {
        'icon-enabled-color': _inheritedStyles['textfield-$_state-icon-color'],
        'icon-disabled-color': _inheritedStyles['textfield-$_state-icon-color'],
      },
      child: IgnorePointer(
        ignoring: !isEnabled || widget.readOnly,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.label != null) ...[
              CText(
                data: widget.label!,
                isRequired: widget.isRequired,
                style: TextStyle(
                  fontSize: _styles['textfield-label-font-size'],
                  fontFamily: _styles['textfield-label-font-family'],
                  color: _styles['textfield-$_status-$_state-label-color'],
                ),
              ),
              const SizedBox(height: 8)
            ],
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                      if (widget.validator != null) _validateInput(value);
                      widget.onChanged?.call(value);
                    },
                    onEditingComplete: widget.onEditingComplete,
                    onSubmitted: widget.onSubmitted,
                    inputFormatters: widget.inputFormatters,
                    cursorColor: _styles['textfield-cursor-color'],
                    keyboardAppearance: widget.keyboardAppearance,
                    onTap: widget.onTap,
                    scrollController: widget.scrollController,
                    scrollPhysics: widget.scrollPhysics,
                    autofillHints: widget.autofillHints,
                    style: TextStyle(
                      fontSize: _styles['textfield-text-font-size'],
                      fontFamily: _styles['textfield-text-font-family'],
                      color: _styles['textfield-$_status-$_state-text-color'],
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 12, bottom: 14),
                      fillColor: Colors.red,
                      /* fillColor: context.styles['textfield-$_state-background-color'] ??
                          _styles['textfield-$_state-background-color'], */
                      hintText: widget.hint,
                      hintStyle: TextStyle(
                        fontSize: _styles['textfield-hint-font-size'],
                        fontFamily: _styles['textfield-hint-font-family'],
                        color: _styles['textfield-$_status-$_state-hint-color'],
                      ),
                      // prefixIconConstraints: BoxConstraints(minWidth: 46, maxWidth: 46), // 44 + 2 (width of border)
                      // suffixIconConstraints: BoxConstraints(minWidth: 46, maxWidth: 46), // 44 + 2 (width of border)
                      /* prefixIcon: widget.prefixIcon,
                      suffixIcon: (() {
                        final icons = <Widget>[];
                        // TODO: add 8px space, if array is not empty, and if empty return null
                        if (_validationResult == null) return widget.suffixIcon;

                        // if (icons.isEmpty) return null;
                        // icons.add(const SizedBox(width: 4));
                        return _validationResult!.icon ?? widget.suffixIcon;
                      })(), */
                      /* border: _styles['textfield-$_status-$_state-border'],
                      enabledBorder: _styles['textfield-$_status-$_state-border'],
                      focusedBorder: _styles['textfield-$_status-$_state-border'], */
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),

            /// NOTE: STEPS:
            /// - widget API needs to be similar to React as possible
            /// - add figma ui features (size, password, popups)
            /// - add icon-size: to inheritedStyles and make icons consume it
            ///   >> the icon size of the textfield will depend on the size of it

            /// REVIEW:
            /// - how about making the suffixIcon as row of icons,
            ///   and if validation result has icon display it,
            ///   this is the same behavior in figma UI
            /// TODO: if added a row of icons
            /// - assert(suffixIcon != null && obsecureText == True)
            /// - refactor flutter textfield

            /// TEST: test the results of this condition

            if (widget.description != null || _validationResult != null) ...[
              const SizedBox(height: 8),
              CText(
                data: _validationResult == null ? widget.description! : _validationResult!.message,
                style: TextStyle(
                  fontSize: _styles['textfield-description-font-size'],
                  fontFamily: _styles['textfield-description-font-family'],
                  color: _styles['textfield-$_status-$_state-description-color'],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
