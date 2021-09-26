class CLinkProps {
  final String? caption;
  final String url;
  final double fontSize;
  final bool enable;
  final void Function(String url) onTap;

  CLinkProps({
    required this.caption,
    required this.url,
    required this.fontSize,
    required this.enable,
    required this.onTap,
  });
}
