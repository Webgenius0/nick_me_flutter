import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/api_acess.dart';
import 'package:nick_me/networks/endpoints.dart';
import 'local_notification_service.dart';

class FirebaseNotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log("Permission : ${settings.authorizationStatus}");

    String? token = await _messaging.getToken();

    log("FCM TOKEN : $token");
    if (token != null) {
      _sendTokenToServer(token);
    }

    _messaging.onTokenRefresh.listen((token) {
      log("FCM Token Refreshed: $token");
      _sendTokenToServer(token);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Foreground Notification");

      if (message.notification != null) {
        LocalNotificationService.showNotification(
          title: message.notification!.title ?? "",
          body: message.notification!.body ?? "",
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Notification Clicked");
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        log("App opened from terminated notification");
      }
    });
  }

  static Future<void> updateFCMTokenToServer() async {
    try {
      String? token = await _messaging.getToken();
      if (token != null) {
        await _sendTokenToServer(token);
      }
    } catch (e) {
      log("Error updating FCM token: $e");
    }
  }

  static Future<void> _sendTokenToServer(String token) async {
    try {
      final authHeader = DioSingleton
          .instance
          .dio
          .options
          .headers[NetworkConstants.AUTHORIZATION];
      if (authHeader != null && authHeader.toString().isNotEmpty) {
        await getUpdateFCMTokenRxObj.updateFCMToken(fcmToken: token);
      }
    } catch (e) {
      log("Error sending FCM token to server: $e");
    }
  }
}
