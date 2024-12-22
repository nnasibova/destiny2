import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:n9/helpers/ui/ui_helpers.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    NotificationSettings settings = await _fcm.getNotificationSettings();
    await getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('Message data: ${message.notification?.title}');

      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification}');
      }

      if (settings.authorizationStatus != AuthorizationStatus.authorized) {
        await _fcm.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: true,
          sound: true,
        );
      }
      UiHelper().showNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        onTap: (p0) {},
      );
    });
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    debugPrint('Token: $token');
    return token;
  }
}
