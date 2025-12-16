import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
class NotificationFireService {
  NotificationFireService._internal();
  static final NotificationFireService instance = NotificationFireService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  // Android channel details
  static const _channelId = 'vaccination_requests';
  static const _channelName = 'طلبات';
  static const _channelDesc = 'إشعار جديد';

  final AndroidNotificationChannel _androidChannel =
      const AndroidNotificationChannel(
    _channelId,
    _channelName,
    description: _channelDesc,
    importance: Importance.max,
    enableVibration: true,
    playSound: true,
    showBadge: true,
        // sound: RawResourceAndroidNotificationSound('notification'),
  );

  Future<void> init() async {
    if (_isInitialized) return;

    if (!kIsWeb) {
      await _requestPermissions();
      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_androidChannel);

      // Initialize local notification tap handling
      await _localNotifications.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/launcher_icon'),
          // android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        ),
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          if (response.payload != null) {
            _onLocalNotificationTap(response.payload!);
          }
        },
      );
    }

    // Register FCM handlers
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleTap);

    // Handle app opened by notification
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleTap(initialMessage);
    }



    _isInitialized = true;
    debugPrint('✅ NotificationService initialized');
  }

  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }

  // Foreground message
  Future<void> _handleForegroundMessage(RemoteMessage msg) async {
    final n = msg.notification;
    final data = msg.data;
    log("📩 Foreground Message Data: ${msg.data}");
    log("📩 Foreground Message Type: ${msg.messageType}");
    if (n == null) return;

    await _showSystemNotification(n.title, n.body, data);

  }

  // Background must be top-level or static
  static Future<void> _handleBackgroundMessage(RemoteMessage msg) async {
    if (msg.notification == null) return;
    final plugin = FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
        NotificationFireService.instance._androidChannel);

    await plugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      msg.notification!.title,
      msg.notification!.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDesc,
          icon: '@mipmap/launcher_icon',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          // sound: RawResourceAndroidNotificationSound('notification'),
        ),
        iOS: DarwinNotificationDetails(
          presentSound: true,
            presentAlert: true,
            presentBadge: true,
            sound: "default"

        )
      ),
      payload: jsonEncode(msg.data),
    );
  }

  void _handleTap(RemoteMessage msg) {
    final data = msg.data;
    log("🖱️ Tap Message Data: ${data}");
    log("🖱️ Tap Message Type: ${msg.messageType}");

    _navigateFromData(data);
  }

  void _onLocalNotificationTap(String payload) {
    try {
      final Map<String, dynamic> data = jsonDecode(payload);
      log("🖱️ Local Notification Tap Data: $data");
      _navigateFromData(data);
    } catch (e) {
      log("❌ Failed to parse payload: $e");
    }
  }

  void _navigateFromData(Map<String, dynamic> data) {
    final type = data['type'];
    final currentRoute = Get.currentRoute;
    log("📍 Current route: $currentRoute");

    if (type == 'appointment_canceled' || type == 'appointment_booked') {
      // Get.to(const DashboardScreen(
      //   initialIndex: 2,
      // ));
    } else {
      // Default action if unknown type
      // Get.toNamed(DashboardScreen.id);
    }
  }

  Future<void> _showSystemNotification(
    String? title,
    String? body,
    Map<String, dynamic> data,
  ) {
    return _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDesc,
          icon: '@mipmap/launcher_icon',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          showWhen: true,
          // sound: RawResourceAndroidNotificationSound('notification'),


        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
            // sound: "notification.wav"
            sound: "default"
        ),
      ),
      payload: jsonEncode(data),
    );
  }

  Future<void> showSystemNotification(
      String? title,
      String? body,
      Map<String, dynamic> data,
      ) {
    return _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDesc,
          icon: '@mipmap/launcher_icon',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          showWhen: true,
          // sound: RawResourceAndroidNotificationSound('notification'),


        ),
        iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            // sound: "notification.wav"
            sound: "default"
        ),
      ),
      payload: jsonEncode(data),
    );
  }
}
