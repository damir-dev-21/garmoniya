import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:garmoniya_pharm/presentation/app.dart';
import 'package:garmoniya_pharm/utils/device_info.dart';
import 'package:garmoniya_pharm/utils/notifications_service.dart';
import 'package:garmoniya_pharm/utils/shared_prefs.dart';

import 'domain/models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.phone.request();
  if (DeviceInfo().getTypeDevice() == 'Android' ||
      DeviceInfo().getTypeDevice() == 'Ios') {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyA1PK1zHRkwsnSeO9FSXoLpBKGR0uY5sME',
        appId: '1:219476656771:web:6fbfe230239108273711b6',
        messagingSenderId: '219476656771',
        projectId: 'pharmlux-d12d4',
        storageBucket: "pharmlux-d12d4.appspot.com",
      ),
    );
  }
  await SharedPrefs().init();
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  await dotenv.load(fileName: "lib/.env");
  await Hive.initFlutter();
  FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.onMessage.listen((event) async {
    print(event.notification);
    NotificationService().showNotification(
      id: Random().nextInt(1000),
      title: event.notification!.title,
      body: event.notification!.body,
      payLoad: "",
    );
  });

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(PharmLux());
}
