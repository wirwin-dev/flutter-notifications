import 'package:flutter_notifications/src/controllers/notification_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_notifications/src/controllers/local_notification.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<AwesomeNotifications>(() => AwesomeNotifications());
  sl.registerLazySingleton<LocalNotification>(
    () => LocalNotification(awesomeNotifications: sl<AwesomeNotifications>()),
  );
  sl.registerLazySingleton<NotificationController>(
    () => NotificationController(
        awesomeNotifications: sl<AwesomeNotifications>()),
  );
}
