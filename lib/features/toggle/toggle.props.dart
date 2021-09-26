import 'toggle.enum.dart';

class CToggleProps {
  /// Called when the value of the toggle change.
  ///
  /// This callback passes a new value, but doesn't update its state
  /// internally.
  ///
  /// @required
  final void Function(bool value) onToggle;

  /// Whether the toggle is enabled or not
  ///
  /// @default: `true`
  final bool enable;

  /// Whether the initial value of the toggle is checked or not.
  ///
  /// @default: `true`
  final bool value;

  /// The `labelText` of this toggle
  ///
  /// @optional
  final String? labelText;

  /// The size of this toggle. It can be `md` or `sm`
  ///
  /// @default: `CToggleSize.md`
  final CToggleSize size;

  /// Whether the toggle should display its status (`On` | `Off`) or not
  ///
  /// @default: `true`
  final bool showStatusLabel;

  CToggleProps({
    required this.onToggle,
    required this.enable,
    required this.value,
    required this.labelText,
    required this.size,
    required this.showStatusLabel,
  });
}
