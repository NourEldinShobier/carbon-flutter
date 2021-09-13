import 'package:flutter/material.dart';
import 'package:carbon/features/overflow_menu/index.dart';
import 'package:carbon/features/text/index.dart';

import 'breadcrumb.style.dart';
import 'breadcrumb_item.widget.dart';

/// The breadcrumb is a secondary navigation pattern that
/// helps a user understand the hierarchy among levels and
/// navigate back through them.
class CBreadcrumb extends StatelessWidget {
  CBreadcrumb({
    Key? key,
    required this.children,
    this.noTrailingSlash = true,
    this.breadcrumbsLimit = 3,
  })  : assert(breadcrumbsLimit >= 3),
        super(key: key);

  /// A list of [CBreadcrumbItem] to display in a row.
  final List<CBreadcrumbItem> children;

  /// Whether to omit the trailing slash for the breadcrumbs or not.
  final bool noTrailingSlash;

  /// To truncate the breadcrumbs when [children] length
  /// exceeds [breadcrumbsLimit].
  final int breadcrumbsLimit;

  final _colors = CBreadcrumbStyle.colors;
  final _menu = COverflowMenuController();
  final _menuKey = GlobalKey();

  List<Widget> _displayAllBreadcrumbs() {
    final divider = CText(
      data: '/',
      style: TextStyle(
        color: _colors['breadcrumb-slash-color'],
        fontSize: 14,
      ),
    );

    final items = [
      for (final item in children) ...[item, divider]
    ];

    if (noTrailingSlash) items.removeLast();

    return items;
  }

  List<Widget> _displayOverflowedBreadcrumbs() {
    var leadingItems = <CBreadcrumbItem>[];
    var hiddenItems = <CBreadcrumbItem>[];
    var trailingItems = <CBreadcrumbItem>[];

    leadingItems.add(children.removeAt(0));
    trailingItems.add(children.removeLast());
    trailingItems.add(children.removeLast());

    trailingItems = List.from(trailingItems.reversed);

    hiddenItems.addAll(children);

    final overflowItem = COverflowMenu(
      controller: _menu,
      size: COverflowMenuSize.sm,
      items: _buildMenuItems(hiddenItems),
      child: CBreadcrumbItem(
        key: _menuKey,
        child: CText(data: '...'),
        onTap: () {
          _menu.open();
        },
      ),
    );

    final divider = CText(
      data: '/',
      style: TextStyle(
        color: _colors['breadcrumb-slash-color'],
        fontSize: 14,
      ),
    );

    final items = <Widget>[
      for (final item in leadingItems) ...[item, divider],
      overflowItem,
      divider,
      for (final item in trailingItems) ...[item, divider],
    ];

    if (noTrailingSlash) items.removeLast();

    return items;
  }

  List<COverflowMenuItem> _buildMenuItems(List<CBreadcrumbItem> items) {
    return items.map(
      (item) {
        return COverflowMenuItem(
          child: item.child,
          onTap: () {
            item.onTap();
            _menu.close();
          },
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: children.length > breadcrumbsLimit ? _displayOverflowedBreadcrumbs() : _displayAllBreadcrumbs(),
    );
  }
}
