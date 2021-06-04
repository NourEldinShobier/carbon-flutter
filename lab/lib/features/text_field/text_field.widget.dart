import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lab/shared/index.dart';
import 'package:lab/features/form/index.dart';
import 'package:lab/features/text/index.dart';

import 'text_field.styles.dart';

class CTextField extends StatefulWidget implements CWidget {
  final bool _enable;

  const CTextField({
    Key? key,
    bool enable = true,
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
  })  : _enable = enable,
        super(key: key);

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
  final CValidationResult Function(String? value)? validator;

  @override
  bool get enable => _enable;

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  CValidationResultType? _status = CValidationResultType.primary;
  var _state = CWidgetState.enabled;

  var _focused = false;

  late FocusNode _focusNode;
  CValidationResult? _validationResult;
  String? _value;

  void focusNodeListener() {
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

  void validator(String? text) {
    CValidationResultType? st;
    _validationResult = widget.validator!(text);

    if (_validationResult == null ||
        _validationResult!.type == CValidationResultType.primary) {
      st = CValidationResultType.primary;
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

  Widget build(BuildContext context) {
    final layout = cTextFieldLayout;
    const colors = cTextFieldG100;

    final cform = context.cform;

    var cwidget = '', type = '', state = '', selector = '', cformType = '';

    /// NOTE: this line doesn't make the widget build twice when [onChange] is
    /// called, because the [validator] calls [setState] when [st != _state].

    if (widget.validator != null && _value != null) validator(_value);

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

    cwidget = 'textfield';
    type = enumToString(_status);
    state = enumToString(_state);

    selector = '$cwidget-$type-$state';

    if (cform != null) {
      cformType = cform.widget.type == CFormType.modal ? 'modalform-' : '';
    }

    return IgnorePointer(
      ignoring: !widget.enable || widget.readOnly,
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
                if (widget.validator != null) validator(value);
                widget.onChanged!(value);
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
                color: colors['$selector-text-color'],
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: 14,
                  top: widget.enable && _focusNode.hasFocus ? 8 : 8,
                  bottom: widget.enable
                      ? _focusNode.hasFocus
                          ? 12.5
                          : 15
                      : 15,
                ),
                fillColor:
                    colors['textfield-$cformType$state-background-color'],
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: layout['textfield-hint-font-size'],
                  fontFamily: layout['textfield-hint-font-family'],
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
                prefixIcon: widget.enable
                    ? widget.prefixIcon
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          colors['textfield-disabled-icon-color']!,
                          BlendMode.color,
                        ),
                        child: widget.prefixIcon,
                      ),
                suffixIcon: widget.enable
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
                border: layout['$selector-border'],
                enabledBorder: layout['$selector-border'],
                focusedBorder: layout['$selector-border'],
              ),
            ),
          ),
          if (widget.description != null) ...[
            const SizedBox(height: 8),
            CText(
              data: _validationResult == null
                  ? widget.description
                  : _validationResult!.message,
              style: TextStyle(
                fontSize: layout['textfield-description-font-size'],
                fontFamily: layout['textfield-description-font-family'],
                color: colors['$selector-description-color'],
              ),
            ),
          ],
        ],
      ),
    );
  }
}