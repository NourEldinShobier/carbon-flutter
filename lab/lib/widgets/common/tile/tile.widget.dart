import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';

import 'tile.style.dart';

class CTile extends StatelessWidget {
  const CTile({
    Key key,
    this.title,
    this.description,
    this.label,
    this.labelSize = 12,
    this.titleSize = 20,
    this.descriptionSize = 14,
    this.content,
  }) : super(key: key);

  final String label;
  final String title;
  final String description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final Widget content;

  @override
  Widget build(BuildContext context) {
    const colors = cTileG100;
    const layout = cTileLayout;

    return Container(
      color: colors['tile-background-color'],
      padding: layout['tile-padding'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            CText(
              data: label,
              style: TextStyle(
                fontSize: labelSize,
                color: colors['tile-label-color'],
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
                color: colors['tile-title-color'],
              ),
            ),
            if (description != null) const SizedBox(height: 11) else const SizedBox(height: 16),
          ],
          if (description != null) ...[
            CText(
              data: description,
              style: TextStyle(
                fontSize: descriptionSize,
              ),
            ),
            const SizedBox(height: 20),
          ],
          if (content != null) content,
        ],
      ),
    );
  }
}
