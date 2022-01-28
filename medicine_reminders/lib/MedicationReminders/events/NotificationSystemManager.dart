import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Contains all hte required setup and functions to interface with the Android
/// notification system.
///
/// This allows the application to send notifications to the user.
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 1 April 2021
///
class NotificationSystemManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationSystemManager() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);
  }

  NotificationSystemManager.initializePlugin() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: null);
  }

  ///Cancel the scheduled Notification reminder
  Future<void> cancelNotification(
      int temp, DateTime start, DateTime end) async {
    var scheduledNotificationDateTime = start;
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: '@mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    int difference = start.difference(end).inDays;
    difference = difference.abs();
    temp = temp * 100;
    int x;
    for (x = 0; x <= difference; x++, temp++) {
      if (scheduledNotificationDateTime.isBefore(DateTime.now())) {
      } else {
        await flutterLocalNotificationsPlugin.cancel(temp);
      }
      scheduledNotificationDateTime =
          scheduledNotificationDateTime.add(Duration(days: 1));
    }
  }

  ///Schedule the Notification for the medical reminder
  Future<void> scheduleNotification(int temp, DateTime start, DateTime end,
      String title, String dosage) async {
    var scheduledNotificationDateTime = start;
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: '@mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    dosage = 'Dosage Information: ' + dosage;

    int difference = start.difference(end).inDays;
    difference = difference.abs();
    print(difference);
    temp = temp * 100;
    int x = 0;

    for (x = 0; x <= difference; x++, temp++) {
      if (scheduledNotificationDateTime.isBefore(DateTime.now())) {
      } else {
        await flutterLocalNotificationsPlugin.schedule(temp, title, dosage,
            scheduledNotificationDateTime, platformChannelSpecifics,
            androidAllowWhileIdle: true);
      }

      scheduledNotificationDateTime =
          scheduledNotificationDateTime.add(Duration(days: 1));
    }
  }
}
