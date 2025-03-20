import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_notifications/src/controllers/local_notification.dart';

class MockAwesomeNotifications extends Mock implements AwesomeNotifications {}

void main() {
  late MockAwesomeNotifications mockAwesomeNotifications;
  late final LocalNotification localNotification;

  setUp(() {
    mockAwesomeNotifications = MockAwesomeNotifications();
    localNotification =
        LocalNotification(awesomeNotifications: mockAwesomeNotifications);
  });

  setUpAll(() {
    registerFallbackValue(
      NotificationContent(
        id: 0,
        channelKey: 'default_notification',
        title: 'Default notification',
        body: 'This is default notification',
        bigPicture:
            'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2023/05/Jujutsu-Kaisen-estrena-nuevas-ilustraciones-oficiales-de-su-temporada-2.jpg',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  });

  test('should create a notification', () {
    when(
      () => mockAwesomeNotifications.createNotification(
        content: any(named: 'content'),
      ),
    ).thenAnswer((_) async => true);

    localNotification.triggerDefaultNotification();

    verify(
      () => mockAwesomeNotifications.createNotification(
        content: any(named: 'content'),
      ),
    ).called(1);
  });
}
