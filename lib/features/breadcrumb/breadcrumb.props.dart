import 'breadcrumb_item.widget.dart';

class CBreadcrumbProps {
  /// A list of [CBreadcrumbItem] to display in a row.
  ///
  /// @required
  final List<CBreadcrumbItem> children;

  /// Whether to omit the trailing slash for the breadcrumbs or not.
  ///
  /// @default: `true`
  final bool noTrailingSlash;

  /// To truncate the breadcrumbs when [children] length
  /// exceeds [breadcrumbsLimit].
  ///
  /// @default: `3`
  final int breadcrumbsLimit;

  CBreadcrumbProps({
    required this.children,
    required this.noTrailingSlash,
    required this.breadcrumbsLimit,
  });
}
