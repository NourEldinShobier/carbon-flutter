class CCheckboxProps {
  final bool enable;
  final bool value;
  final String? label;
  final double labelSize;
  final void Function(bool value) onChange;

  CCheckboxProps({
    required this.enable,
    required this.value,
    required this.label,
    required this.labelSize,
    required this.onChange,
  });
}
