import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showCustomNotification(String title, String body) async {
  FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
  var androidd = AndroidInitializationSettings('@mipmap/ic_launcher');
  var iOSS = DarwinInitializationSettings();
  var initSetttings = InitializationSettings(android: androidd, iOS: iOSS);
  flp.initialize(initSetttings);

  var android = AndroidNotificationDetails(
    'channel id',
    'channel NAME',
    priority: Priority.high,
    importance: Importance.max,
    styleInformation: BigTextStyleInformation(''),
    ledOnMs: 2000,
    enableVibration: true,
    playSound: true,
    visibility: NotificationVisibility.public,
  );
  var iOS = DarwinNotificationDetails();
  var platform = NotificationDetails(android: android, iOS: iOS);
  await flp.show(3, body, title, platform, payload: 'VIS \n $title');
}
