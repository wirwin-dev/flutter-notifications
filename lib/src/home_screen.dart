import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'controllers/local_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _awesomeNotifications = AwesomeNotifications();
  late final LocalNotification _localNotification;

  @override
  void initState() {
    _localNotification =
        LocalNotification(awesomeNotifications: _awesomeNotifications);
    _awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        _awesomeNotifications.requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _localNotification.triggerDefaultNotification,
            child: const Text(
              'Basic notification',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _localNotification.scheduleNotification,
                  child: const Text(
                    'Schedule notification',
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      _localNotification.cancelScheduleNotification(1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Cancel schedule notification',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
