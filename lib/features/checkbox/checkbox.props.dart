class CCheckboxProps {
  /// Called when the value of the checkbox change.
  ///
  /// This callback passes a new value, but doesn't update its state
  /// internally.
  ///
  /// @required
  final void Function(bool value) onChange;

  /// Whether the checkbox is enabled or not.
  ///
  /// @default: `true`
  final bool enable;

  /// Whether the checkbox is checked or not.
  ///
  /// @default: `true`
  final bool value;

  /// A text to display beside the checkbox.
  ///
  /// @optional
  final String? label;

  CCheckboxProps({
    required this.enable,
    required this.value,
    required this.label,
    required this.onChange,
  });
}
