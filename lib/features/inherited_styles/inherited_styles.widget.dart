import 'package:flutter/widgets.dart';

import 'inherited_styles.extension.dart';

typedef StylesMap = Map<String, dynamic>;

class CInheritedStyles extends StatelessWidget {
  const CInheritedStyles({
    Key? key,
    required this.styles,
    required this.child,
    this.inheritFromParent = true,
  }) : super(key: key);

  final Widget child;

  final StylesMap styles;

  /// Whether the current widget should inherit the styles or
  /// only use the local [value].
  final bool inheritFromParent;

  static StylesMap? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_CInheritedStylesWidget>()?.value;
  }

  StylesMap _styles(BuildContext context) {
    if (inheritFromParent) {
      final parentStyles = context.styles;
      final StylesMap stylesClone = {};

      stylesClone.addAll(styles);
      stylesClone.addAll(parentStyles);

      return stylesClone;
    }

    return styles;
  }

  @override
  Widget build(BuildContext context) {
    return _CInheritedStylesWidget(
      value: _styles(context),
      child: child,
    );
  }
}

class _CInheritedStylesWidget extends InheritedWidget {
  const _CInheritedStylesWidget({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  final StylesMap value;

  @override
  bool updateShouldNotify(_CInheritedStylesWidget old) => value != old.value;
}
