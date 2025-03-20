import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController extends ChangeNotifier {
  final AwesomeNotifications _awesomeNotifications;

  NotificationController({required AwesomeNotifications awesomeNotifications})
      : _awesomeNotifications = awesomeNotifications;

  Future<void> initializeNotifications({
    required bool debug,
  }) async {
    await _awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'default_notification',
          channelName: 'Default Notification',
          channelDescription: 'Default notification for test',
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Secret,
          enableVibration: true,
          defaultColor: Colors.red[100],
          enableLights: true,
          channelShowBadge: true,
          icon: 'resource://drawable/gojo_icon',
          playSound: true,
          soundSource: 'resource://raw/jujutsu_bells',
        ),
        NotificationChannel(
          channelKey: 'schedule_notification',
          channelName: 'Schedule Notification',
          channelDescription: 'Schedule notification for test',
          importance: NotificationImportance.Max,
          defaultPrivacy: NotificationPrivacy.Secret,
          enableVibration: true,
          defaultColor: Colors.red[100],
          enableLights: true,
          channelShowBadge: true,
          icon: 'resource://drawable/gojo_icon',
          playSound: true,
          soundSource: 'resource://raw/jujutsu_bells',
        ),
      ],
      debug: debug,
    );
  }

  Future<void> initializeNotificationsEventListeners() async {
    await _awesomeNotifications.setListeners(
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    final isSilentAction = receivedNotification.actionType ==
            ActionType.SilentAction ||
        receivedNotification.actionType == ActionType.SilentBackgroundAction;

    log('${isSilentAction ? 'silent action' : 'Action'} notification received');
  }

  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    log('Notification received');
  }

  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    log('Notification displayed');
  }

  Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    log('Notification dismissed');
  }
}
