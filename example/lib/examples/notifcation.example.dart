import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';

class CNotificationExample extends StatelessWidget {
  const CNotificationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.green100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              CText(
                data: 'Toast notification',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        kind: CNotificationKind.error,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        kind: CNotificationKind.warning,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        kind: CNotificationKind.success,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        kind: CNotificationKind.error,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        kind: CNotificationKind.warning,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        kind: CNotificationKind.success,
                        title: CText(data: 'Notification title'),
                        subtitle: CText(data: 'Subtitle text goes here.'),
                        caption: CText(data: 'Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CText(
                data: 'Inline notification',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Long text. Long text. Long text. Long text. Long text. Long text. Long text. Long text.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.error,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.warning,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.success,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    //
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      lowContrast: false,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.error,
                      lowContrast: false,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.warning,
                      lowContrast: false,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.success,
                      lowContrast: false,
                      title: CText(data: 'Notification title'),
                      subtitle: CText(data: 'Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: CText(data: 'Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
