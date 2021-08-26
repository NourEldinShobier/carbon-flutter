import 'package:carbon/features/overflow_menu/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

import 'breadcrumb.style.dart';
import 'breadcrumb_item.widget.dart';

class CBreadcrumb extends StatelessWidget {
  CBreadcrumb({
    Key? key,
    required this.children,
    this.noTrailingSlash = true,
    this.breadcrumbsLimit = 4,
    this.dividerSize = 14,
  }) : super(key: key);

  /// Pass in the BreadcrumbItem's for your Breadcrumb
  final List<CBreadcrumbItem> children;

  /// Optional prop to omit the trailing slash for the breadcrumbs
  final bool noTrailingSlash;

  /// Truncate the breadcrumbs when [children] length exceeds [breadcrumbsLimit]
  final int breadcrumbsLimit;

  /// Divider font size
  final double dividerSize;

  final _colors = CBreadcrumbStyle.colors;
  final _menuKey = GlobalKey();

  late final COverflowMenu _menu;

  List<Widget> _displayAllBreadcrumbs() {
    final items = [
      for (var i = 0; i < children.length; i++) ...[
        children[i],
        Text(
          '/',
          style: TextStyle(
            color: _colors['breadcrumb-slash-color'],
            fontWeight: FontWeight.w400,
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
    final remainingItems = children;

    _buildMenuItems(remainingItems);

    final overflowItem = CBreadcrumbItem(
      key: _menuKey,
      child: CText(data: '...'),
      onTap: () {
        _menu.open();
      },
    );

    final divider = CText(
      data: '/',
      style: TextStyle(
        color: _colors['breadcrumb-slash-color'],
        fontFamily: CFonts.primaryRegular,
        fontSize: dividerSize,
      ),
    );

    final items = [firstItem, divider, overflowItem, divider, secondLastItem, divider, lastItem, divider];

    if (noTrailingSlash) items.removeLast();

    return items;
  }

  void _buildMenuItems(List<CBreadcrumbItem> items) {
    _menu = COverflowMenu(
      key: _menuKey,
      size: COverflowMenuSize.sm,
      barrierDismissible: true,
      items: items.map(
        (item) {
          return COverflowMenuItem(
            child: item.child,
            onTap: () {
              item.onTap();
              _menu.close();
            },
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children.length < breadcrumbsLimit ? _displayAllBreadcrumbs() : _displayOverflowedBreadcrumbs(),
    );
  }
}
