import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notifications/src/controllers/notification_controller.dart';
import 'package:flutter_notifications/src/di/service_locator.dart';

import 'controllers/local_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _awesomeNotifications = sl<AwesomeNotifications>();
  final _localNotification = sl<LocalNotification>();
  final _notificationController = sl<NotificationController>();

  @override
  void initState() {
    _awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        _awesomeNotifications.requestPermissionToSendNotifications();
      }
    });
    _notificationController.initializeNotificationsEventListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _localNotification.triggerDefaultNotification,
              child: const Text(
                'Basic notification',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _localNotification.triggerNotificationWithActionButtons,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Actions notification',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _localNotification.scheduleNotification,
              child: const Text(
                'Schedule notification',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _localNotification.cancelScheduleNotification(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Cancel schedule notification',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
