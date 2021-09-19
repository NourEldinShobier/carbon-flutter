import 'package:flutter/widgets.dart';

import 'enable.extension.dart';

/// A widget used to enable/disable a group of widgets below this
/// widget in the tree based on an inherited value.
class CEnable extends StatelessWidget {
  const CEnable({
    Key? key,
    this.value = true,
    this.inheritFromParent = true,
    required this.child,
  }) : super(key: key);

  /// Whether to enable/disable widgets below this widget.
  final bool value;

  /// Whether the current widget should inherit the enable value
  /// or only use the local [value].
  final bool inheritFromParent;

  /// The widget below this widget in the tree.
  final Widget child;

  static bool? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedCEnable>()?.value;
  }

  bool _isEnabled(BuildContext context) {
    if (inheritFromParent) {
      return context.inheritedEnable ? value : false;
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCEnable(
      value: _isEnabled(context),
      child: child,
    );
  }
}

class _InheritedCEnable extends InheritedWidget {
  const _InheritedCEnable({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  final bool value;

  @override
  bool updateShouldNotify(_InheritedCEnable old) => value != old.value;
}
