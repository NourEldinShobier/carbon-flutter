import 'package:carbon/features/tile/tile.props.dart';
import 'package:flutter/widgets.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/features/text/index.dart';

import 'tile.style.dart';

class CTile extends StatelessWidget {
  CTile({
    Key? key,
    bool enable = true,
    String? title,
    String? description,
    String? label,
    double labelSize = 12,
    double titleSize = 20,
    double descriptionSize = 14,
    Widget? content,
  })  : props = CTileProps(
          enable: enable,
          label: label,
          title: title,
          description: description,
          labelSize: labelSize,
          titleSize: titleSize,
          descriptionSize: descriptionSize,
          content: content,
        ),
        super(key: key);

  final CTileProps props;

  final _colors = CTileStyle.colors;
  final _layouts = CTileStyle.layouts;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? props.enable : false;
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
            if (props.label != null) ...[
              CText(
                data: props.label!,
                style: TextStyle(
                  fontSize: props.labelSize,
                  color: _colors['$cwidget-$state-label-color'],
                ),
              ),
              const SizedBox(height: 4),
            ],
            if (props.label != null) ...[
              if (props.label == null) const SizedBox(height: 8),
              CText(
                data: props.label!,
                style: TextStyle(
                  fontSize: props.titleSize,
                  color: _colors['$cwidget-$state-title-color'],
                ),
              ),
              if (props.description != null) const SizedBox(height: 11) else const SizedBox(height: 16),
            ],
            if (props.description != null) ...[
              CText(
                data: props.description!,
                style: TextStyle(
                  fontSize: props.descriptionSize,
                  color: _colors['$cwidget-$state-description-color'],
                ),
              ),
              const SizedBox(height: 20),
            ],
            if (props.content != null) props.content!,
          ],
        ),
      ),
    );
  }
}
