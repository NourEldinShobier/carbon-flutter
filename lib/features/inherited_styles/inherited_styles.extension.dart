import 'package:flutter/widgets.dart';

import 'inherited_styles.widget.dart';

extension CInheritedStylesContextExtension on BuildContext {
  Map<String, dynamic> get styles {
    final inheritedStyles = CInheritedStyles.of(this);

    if (inheritedStyles == null) return {};

    return inheritedStyles.styles;
  }
}