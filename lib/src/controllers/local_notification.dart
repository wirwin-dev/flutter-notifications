import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotification {
  static void triggerDefaultNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'default_notification',
        title: 'Default notification',
        body: 'This is default notification',
        bigPicture:
            'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2023/05/Jujutsu-Kaisen-estrena-nuevas-ilustraciones-oficiales-de-su-temporada-2.jpg',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  static Future<void> scheduleNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'schedule_notification',
        title: 'Schedule notification',
        body: 'This is schedule notification',
        bigPicture:
            'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2023/05/Jujutsu-Kaisen-estrena-nuevas-ilustraciones-oficiales-de-su-temporada-2.jpg',
        notificationLayout: NotificationLayout.BigPicture,
      ),
      schedule: NotificationCalendar(
        second: 0,
        repeats: true,
      ),
    );
  }

  static Future<void> cancelScheduleNotification(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }
}
