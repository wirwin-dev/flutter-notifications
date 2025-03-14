import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'controllers/local_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ElevatedButton(
            onPressed: LocalNotification.triggerDefaultNotification,
            child: Text(
              'Basic notification',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                child: ElevatedButton(
                  onPressed: LocalNotification.scheduleNotification,
                  child: Text(
                    'Schedule notification',
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      LocalNotification.cancelScheduleNotification(1),
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
