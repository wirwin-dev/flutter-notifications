import 'package:flutter/material.dart';
import 'package:flutter_notifications/src/di/service_locator.dart';
import 'package:flutter_notifications/src/home_screen.dart';

import 'src/controllers/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await sl<NotificationController>().initializeNotifications(
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
