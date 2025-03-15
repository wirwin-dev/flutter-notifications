import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_notifications/src/controllers/local_notification.dart';

class MockAwesomeNotifications extends Mock implements AwesomeNotifications {}

void main() {
  late MockAwesomeNotifications mockAwesomeNotifications;

  setUp(() {
    mockAwesomeNotifications = MockAwesomeNotifications();
  });

  test('should create a notification', () {
    when(() => mockAwesomeNotifications.createNotification(
          content: any(named: 'content'),
        )).thenAnswer((_) async => true);

    LocalNotification.triggerDefaultNotification();

    verify(() => mockAwesomeNotifications.createNotification(
          content: any(named: 'content'),
        )).called(1);
  });
}
