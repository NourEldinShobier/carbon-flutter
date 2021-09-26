import 'package:flutter/widgets.dart';

import 'breadcrumb_item.widget.dart';

class CBreadcrumbProps {
  /// A list of [CBreadcrumbItem] to display in a row.
  final List<CBreadcrumbItem> children;

  /// Whether to omit the trailing slash for the breadcrumbs or not.
  final bool noTrailingSlash;

  /// To truncate the breadcrumbs when [children] length
  /// exceeds [breadcrumbsLimit].
  final int breadcrumbsLimit;

  CBreadcrumbProps({
    required this.children,
    required this.noTrailingSlash,
    required this.breadcrumbsLimit,
  });
}

class CBreadcrumbItemProps {
  // The content of the item.
  final Widget child;

  /// Whether this breadcrumb item represents the current page or not.
  final bool isCurrentPage;

  /// Called when the item is tapped.
  final VoidCallback onTap;

  CBreadcrumbItemProps({
    required this.child,
    required this.isCurrentPage,
    required this.onTap,
  });
}
