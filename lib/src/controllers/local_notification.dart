import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotification {
  const LocalNotification({
    required AwesomeNotifications awesomeNotifications,
  }) : _awesomeNotifications = awesomeNotifications;

  final AwesomeNotifications _awesomeNotifications;

  void triggerDefaultNotification() {
    _awesomeNotifications.createNotification(
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

  Future<void> scheduleNotification() async {
    await _awesomeNotifications.createNotification(
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

  Future<void> cancelScheduleNotification(int id) async {
    await _awesomeNotifications.cancelSchedule(id);
  }
}
