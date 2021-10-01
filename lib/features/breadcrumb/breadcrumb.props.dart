import 'package:flutter/widgets.dart';

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

class CBreadcrumbItemProps {
  /// The content of the item.
  ///
  /// @required
  final Widget child;

  /// Called when the item is tapped.
  ///
  /// @required
  final VoidCallback onTap;

  /// Whether this breadcrumb item represents the current page or not.
  ///
  /// @default: `false`
  final bool isCurrentPage;

  CBreadcrumbItemProps({
    required this.child,
    required this.isCurrentPage,
    required this.onTap,
  });
}
