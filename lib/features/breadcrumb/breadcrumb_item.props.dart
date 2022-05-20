import 'package:flutter/widgets.dart';

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
