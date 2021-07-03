import 'package:flutter/material.dart';
import 'package:lab/carbon.dart';
import 'package:lab/features/notification/notification.enum.dart';

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
              Text(
                'Toast notification',
                style: TextStyle(
                  fontFamily: CFonts.primaryLight,
                  color: CColors.gray10,
                  fontSize: 32,
                ),
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
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        kind: CNotificationKind.error,
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        kind: CNotificationKind.warning,
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        kind: CNotificationKind.success,
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
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
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        kind: CNotificationKind.error,
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        kind: CNotificationKind.warning,
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                      CNotification.toast(
                        onCloseButtonTap: () {},
                        lowContrast: false,
                        kind: CNotificationKind.success,
                        title: Text('Notification title'),
                        subtitle: Text('Subtitle text goes here.'),
                        caption: Text('Time stamp [00:00:00]'),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Inline notification',
                style: TextStyle(
                  fontFamily: CFonts.primaryLight,
                  color: CColors.gray10,
                  fontSize: 32,
                ),
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
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      title: Text('Notification title'),
                      subtitle: Text('Long text. Long text. Long text. Long text. Long text. Long text. Long text. Long text.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.error,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.warning,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.success,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    //
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      lowContrast: false,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.error,
                      lowContrast: false,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.warning,
                      lowContrast: false,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CNotification.inline(
                      onCloseButtonTap: () {},
                      kind: CNotificationKind.success,
                      lowContrast: false,
                      title: Text('Notification title'),
                      subtitle: Text('Subtitle text goes here.'),
                      actions: [
                        CNotificationActionButton(child: Text('Action'), onTap: () {}),
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
