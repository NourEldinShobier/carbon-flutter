import 'package:flutter/widgets.dart';

import 'inherited_styles.widget.dart';

extension CInheritedStylesContextExtension on BuildContext {
  StylesMap get styles {
    final inheritedStyles = CInheritedStyles.of(this);

    if (inheritedStyles == null) return {};

    return inheritedStyles;
  }
}
