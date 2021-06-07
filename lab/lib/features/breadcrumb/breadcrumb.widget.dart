import 'package:flutter/material.dart';
import 'package:lab/shared/index.dart';

import 'breadcrumb.style.dart';
import 'breadcrumbItem.widget.dart';

class CBreadcrumb extends StatelessWidget {
  const CBreadcrumb({
    Key? key,
    required this.children,
    this.noTrailingSlash = true,
    this.overflowLimit = 4,
    this.dividerSize = 14,
  }) : super(key: key);

  /// Pass in the BreadcrumbItem's for your Breadcrumb
  final List<CBreadcrumbItem> children;

  /// Optional prop to omit the trailing slash for the breadcrumbs
  final bool noTrailingSlash;

  /// Truncate the breadcrumbs when [children] length exceeds [overflowLimit]
  final int overflowLimit;

  /// Divider font size
  final double dividerSize;

  final _colors = cBreadcrumbColors;

  List<Widget> _displayAllBreadcrumbs() {
    final items = [
      for (var i = 0; i < children.length; i++) ...[
        children[i],
        Text(
          '/',
          style: TextStyle(
            color: _colors['breadcrumb-slash-color'],
            fontFamily: CFonts.primaryRegular,
            fontSize: dividerSize,
          ),
        ),
      ]
    ];

    if (noTrailingSlash) items.removeLast();

    return items;
  }

  List<Widget> _displayOverflowedBreadcrumbs() {
    final firstItem = children.removeAt(0);
    final lastItem = children.removeLast();
    final secondLastItem = children.removeLast();

    // TODO: activate after adding overflow menu
    final remainingItems = children;

    final overflowItem = CBreadcrumbItem(child: Text('...'), onTap: () {});

    final divider = Text(
      '/',
      style: TextStyle(
        color: _colors['breadcrumb-slash-color'],
        fontFamily: CFonts.primaryRegular,
        fontSize: dividerSize,
      ),
    );

    final items = [
      firstItem,
      divider,
      overflowItem,
      divider,
      secondLastItem,
      divider,
      lastItem,
      divider
    ];

    if (noTrailingSlash) items.removeLast();

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children.length < overflowLimit
          ? _displayAllBreadcrumbs()
          : _displayOverflowedBreadcrumbs(),
    );
  }
}
