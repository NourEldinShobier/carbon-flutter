import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';

class CBreadcrumbExample extends StatelessWidget {
  const CBreadcrumbExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            CText(
              data: 'Carbon Breadcrumb',
              style: TextStyle(
                color: CColors.gray10,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 48),
            CBreadcrumb(
              children: [
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
              ],
            ),
            const SizedBox(height: 48),
            CBreadcrumb(
              children: [
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
                CBreadcrumbItem(child: CText(data: 'Item'), onTap: () {}),
                CBreadcrumbItem(
                  onTap: () {},
                  isCurrentPage: true,
                  child: CText(data: 'Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
