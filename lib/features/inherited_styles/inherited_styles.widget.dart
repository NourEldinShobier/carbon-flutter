import 'package:flutter/widgets.dart';

class CInheritedStyles extends InheritedWidget {
  const CInheritedStyles({
    Key? key,
    required this.styles,
    required Widget child,
  }) : super(key: key, child: child);

  final Map<String, dynamic> styles;

  static CInheritedStyles? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CInheritedStyles>();
  }

  @override
  bool updateShouldNotify(CInheritedStyles oldWidget) => styles != oldWidget.styles;
}
