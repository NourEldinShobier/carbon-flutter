import 'package:flutter/material.dart';

import 'enable.extension.dart';

class CEnable extends StatelessWidget {
  const CEnable({
    Key? key,
    this.value = true,
    required this.child,
  }) : super(key: key);

  final bool value;
  final Widget child;

  static bool? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedCEnable>()?.value;
  }

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? value : false;
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
