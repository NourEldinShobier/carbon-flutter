import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';
import 'package:carbon/features/text/index.dart';

import 'tile.style.dart';

class CTile extends StatelessWidget implements CWidget {
  final bool _enable;

  const CTile({
    Key? key,
    bool enable = true,
    this.title,
    this.description,
    this.label,
    this.labelSize = 12,
    this.titleSize = 20,
    this.descriptionSize = 14,
    this.content,
  })  : _enable = enable,
        super(key: key);

  final String? label;
  final String? title;
  final String? description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final Widget? content;

  @override
  bool get enable => _enable;

  final _colors = CTileStyle.colors;
  final _layouts = CTileStyle.layouts;

  @override
  Widget build(BuildContext context) {
    /// styles helpers
    String cwidget = 'tile';
    String state = enable ? 'enabled' : 'disabled';

    return IgnorePointer(
      ignoring: !enable,
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
