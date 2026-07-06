import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nick_me/networks/dio/dio.dart';
import 'package:nick_me/networks/api_acess.dart';
import 'package:nick_me/networks/endpoints.dart';
import 'package:nick_me/helpers/di.dart';
import 'package:nick_me/helpers/navigation_service.dart';
import 'package:nick_me/helpers/all_routes.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';
import 'local_notification_service.dart';

class FirebaseNotificationService {
  static bool openedFromNotification = false;

  static String? get stoicSlug => appData.read('stoic_slug');
  static set stoicSlug(String? value) {
    if (value != null) {
      appData.write('stoic_slug', value);
    } else {
      appData.remove('stoic_slug');
    }
  }

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
          payload: message.data['stoic_slug'],
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Notification Clicked");
      String? slug = message.data['stoic_slug'];
      if (slug != null) {
        stoicSlug = slug;
        log("stoic_slug: $stoicSlug");
        fetchAndNavigate();
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        log("App opened from terminated notification");
        String? slug = message.data['stoic_slug'];
        if (slug != null) {
          stoicSlug = slug;
          log("stoic_slug: $stoicSlug");
          openedFromNotification = true;
        }
      }
    });
  }

  static Future<void> fetchAndNavigate() async {
    final context = NavigationService.context;
    if (context == null) {
      log("Navigation context is null, retrying with delay...");
      Future.delayed(const Duration(milliseconds: 500), fetchAndNavigate);
      return;
    }

    final slug = appData.read('stoic_slug');
    if (slug == null || slug.isEmpty) {
      log("No stoic_slug found to fetch.");
      return;
    }

    final lastProcessed = appData.read('last_processed_slug');
    if (slug == lastProcessed) {
      log(
        "Notification slug $slug has already been processed. Skipping navigation.",
      );
      return;
    }

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => loadingIndicatorCircle(context: context),
      );

      bool success = await getNotificationDataRxObj.getNotificationData(slug);

      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      if (success) {
        appData.write('last_processed_slug', slug);
        NavigationService.navigateTo(Routes.notificationDatashowScreen);
      }
    } catch (e) {
      log("Error in fetchAndNavigate: $e");
      if (context.mounted) {
        try {
          Navigator.of(context, rootNavigator: true).pop();
        } catch (_) {}
      }
    }
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
