import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();

  // إشعار عادي
  static Future<void> showInstantNotification({
    required String title,
    required String body,
  }) async {
    await _notifications.show(
      DateTime.now().millisecond,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'med_channel',
          'Medicines Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  // إشعار يومي
  static Future<void> scheduleDaily({
    required int id,
    required int hour,
    required int minute,
    required String title,
    required String body,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'med_channel',
      'Medicines Reminders',
      channelDescription: 'Channel for medicine reminders',
      importance: Importance.max,
      priority: Priority.high,
    );

    final platformDetails = NotificationDetails(android: androidDetails);

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      _nextDailyTime(hour, minute),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,

    );
  }


  // أسبوعي
  static Future<void> scheduleWeekly({
    required int id,
    required int hour,
    required int minute,
    required int weekday, // 1 Monday .. 7 Sunday
    required String title,
    required String body,
  }) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      _nextWeeklyTime(hour, minute, weekday),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'med_channel',
          'Medicines Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // uiLocalNotificationDateInterpretation:
      // UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  // شهري
  static Future<void> scheduleMonthly({
    required int id,
    required int hour,
    required int minute,
    required int day,
    required String title,
    required String body,
  }) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      _nextMonthlyTime(hour, minute, day),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'med_channel',
          'Medicines Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // uiLocalNotificationDateInterpretation:
      // UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfMonthAndTime,
    );
  }

  // حساب الوقت القادم
  static tz.TZDateTime _nextDailyTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  static tz.TZDateTime _nextWeeklyTime(
      int hour, int minute, int weekday) {
    tz.TZDateTime scheduled = _nextDailyTime(hour, minute);

    while (scheduled.weekday != weekday) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  static tz.TZDateTime _nextMonthlyTime(int hour, int minute, int day) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
    tz.TZDateTime(tz.local, now.year, now.month, day, hour, minute);

    if (scheduled.isBefore(now)) {
      scheduled = tz.TZDateTime(
          tz.local, now.year, now.month + 1, day, hour, minute);
    }
    return scheduled;
  }
}
