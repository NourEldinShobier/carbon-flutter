import 'package:flutter/widgets.dart';

/// This mixin adds a [didInitState] lifecycle method to a [StatefulWidget] [State] object.
/// From there you can safely access [BuildContext.inheritFromWidgetOfExactType].
mixin AfterInitMixin<T extends StatefulWidget> on State<T> {
  bool _didInitState = false;

  @override
  @mustCallSuper
  void didChangeDependencies() {
    if (!_didInitState) {
      didInitState();
      _didInitState = true;
    }
    super.didChangeDependencies();
  }

  /// Called only once, after [initState], and before [didChangeDependencies].
  void didInitState();
}
