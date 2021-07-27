import 'package:flutter/material.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/features/text/index.dart';

import 'tile.style.dart';

class CTile extends StatelessWidget {
  const CTile({
    Key? key,
    this.enable = true,
    this.title,
    this.description,
    this.label,
    this.labelSize = 12,
    this.titleSize = 20,
    this.descriptionSize = 14,
    this.content,
  }) : super(key: key);

  final bool enable;

  final String? label;
  final String? title;
  final String? description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final Widget? content;

  final _colors = CTileStyle.colors;
  final _layouts = CTileStyle.layouts;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? enable : false;
  }

  @override
  Widget build(BuildContext context) {
    /// styles helpers
    String cwidget = 'tile';
    String state = _isEnabled(context) ? 'enabled' : 'disabled';

    return IgnorePointer(
      ignoring: !_isEnabled(context),
      child: Container(
        color: _colors['$cwidget-$state-background-color'],
        padding: _layouts['$cwidget-padding'],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              CText(
                data: label,
                style: TextStyle(
                  fontSize: labelSize,
                  color: _colors['$cwidget-$state-label-color'],
                ),
              ),
              const SizedBox(height: 4),
            ],
            if (title != null) ...[
              if (label == null) const SizedBox(height: 8),
              CText(
                data: title,
                style: TextStyle(
                  fontSize: titleSize,
                  color: _colors['$cwidget-$state-title-color'],
                ),
              ),
              if (description != null) const SizedBox(height: 11) else const SizedBox(height: 16),
            ],
            if (description != null) ...[
              CText(
                data: description,
                style: TextStyle(
                  fontSize: descriptionSize,
                  color: _colors['$cwidget-$state-description-color'],
                ),
              ),
              const SizedBox(height: 20),
            ],
            if (content != null) content!,
          ],
        ),
      ),
    );
  }
}
