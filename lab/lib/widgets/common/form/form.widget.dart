import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

import 'form.style.dart';

class CForm extends StatefulWidget {
  CForm({
    Key? key,
    this.title,
    this.description,
    this.label,
    this.labelSize = 12,
    this.titleSize = 20,
    this.descriptionSize = 14,
    this.type = CFormType.modal,
    this.content,
    this.actions,
  }) : super(key: key);

  final CFormType type;
  final String? label;
  final String? title;
  final String? description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final Widget? content;
  final Widget? actions;

  CFormState createState() => CFormState();

  static CFormState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InteritedCForm>()!.state;
  }
}

class CFormState extends State<CForm> {
  @override
  Widget build(BuildContext context) {
    const layout = cFormLayout;
    const colors = cFormG100;

    final formType = enumToString(widget.type);
    final style = 'form-$formType';

    return _InteritedCForm(
      state: this,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: colors['$style-background-color'],
            padding: layout['$style-padding'],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.label != null) ...[
                  CText(
                    data: widget.label,
                    style: TextStyle(
                      fontSize: widget.labelSize,
                      color: colors['$style-label-color'],
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                if (widget.title != null) ...[
                  if (widget.label == null) const SizedBox(height: 8),
                  CText(
                    data: widget.title,
                    style: TextStyle(
                      fontSize: widget.titleSize,
                      color: colors['$style-title-color'],
                    ),
                  ),
                  if (widget.description != null)
                    const SizedBox(height: 11)
                  else
                    const SizedBox(height: 16),
                ],
                if (widget.description != null) ...[
                  CText(
                    data: widget.description,
                    style: TextStyle(
                      fontSize: widget.descriptionSize,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                if (widget.content != null) widget.content!,
              ],
            ),
          ),
          if (widget.actions != null) widget.actions!,
        ],
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
