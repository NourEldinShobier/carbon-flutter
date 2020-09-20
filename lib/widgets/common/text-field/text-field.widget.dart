import 'package:carbon/carbon.dart';

import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

export './text-field.styles.dart';

class CTextField extends StatefulWidget {
  const CTextField({Key key, @required this.props}) : super(key: key);

  final Map<String, dynamic> props;

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  var status = CWidgetStatus.primary;

  String validator(String text) {
    if (widget.props['validator'] == null) return null;

    String error = widget.props['validator'](text);
    CWidgetStatus st;

    if (error == null)
      st = CWidgetStatus.primary;
    else
      st = CWidgetStatus.danger;

    if (st != status) {
      status = st;
      setState(() {});
    }

    return error;
  }

  Widget build(BuildContext context) {
    final carbon = context.style;
    // add disabled,
    // if you will use keepfocus, you need to copy focus node

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.props['labelText'] != null) ...[
          /* CText(
            props: {
              'value': widget.props['labelText'],
              'required': widget.props['required'],
            },
            style: {
              'font-size': carbon.get('textfield-label-fontsize'),
              'font-family': carbon.get('textfield-label-fontfamily'),
              'text-color': carbon.get('textfield-label-color'),
            },
          ), */
          SizedBox(height: 8)
        ],
        SizedBox(
          width: widget.props['width'],
          height: status == CWidgetStatus.danger
              ? widget.props['height'] + 29
              : widget.props['height'],
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            validator: validator,
            focusNode: widget.props['focusNode'],
            obscureText: widget.props['obscureText'] ?? false,
            keyboardType: widget.props['keyboardType'],
            controller: widget.props['controller'],
            cursorColor: carbon.get('textfield-cursor-color'),
            onTap: widget.props['onTap'],
            onEditingComplete: widget.props['onEditingComplete'],
            onChanged: widget.props['onChanged'],
            style: TextStyle(
              color: carbon.get('textfield-text-color'),
              fontFamily: carbon.get('textfield-fontfamily'),
              fontSize: carbon.get('textfield-fontsize'),
            ),
            decoration: InputDecoration(
              filled: true,
              contentPadding: padding(horizontal: 0),
              fillColor: carbon.get('textfield-background-color'),
              hintText: widget.props['hintText'],
              hintStyle: TextStyle(
                color: carbon.get('textfield-hint-color'),
                fontFamily: carbon.get('textfield-hint-fontfamily'),
                fontSize: carbon.get('textfield-hint-fontsize'),
              ),
              errorStyle: TextStyle(
                color: carbon.get('textfield-error-color'),
                fontFamily: carbon.get('textfield-error-fontfamily'),
                fontSize: carbon.get('textfield-error-fontsize'),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),
              suffixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),
              prefixIcon: widget.props['prefixIcon'],
              suffixIcon: status == CWidgetStatus.danger
                  ? _XTextFieldErrorIcon()
                  : widget.props['suffixIcon'],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Color(0xFFFB4B53), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Color(0xFF0F62FE), width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: Color(0xFFFB4B53), width: 2),
              ),
            ),
          ),
        ),
      ],
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
