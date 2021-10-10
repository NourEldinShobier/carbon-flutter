class CLinkProps {
  /// The destination that this link leads to.
  ///
  /// @required
  final String url;

  /// Called when the link is tapped, it also passes the [url] value.
  ///
  /// @required
  final void Function(String url) onTap;

  /// A caption text to display instead of the [url].
  /// If it's null, then the URL will be displayed.
  ///
  /// @optional
  final String? caption;

  /// Whether the link is enabled or not.
  ///
  /// @default: `true`
  final bool enable;

  /// The size of glyphs (in logical pixels) to use when painting the text.
  ///
  /// @default: `14`
  final double fontSize;

  CLinkProps({
    required this.caption,
    required this.url,
    required this.fontSize,
    required this.enable,
    required this.onTap,
  });
}
