import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('=====TOKEN====');
      print(token);

      //fvj1wTxTRSyFcJPEZvzGms:APA91bH9RbYifM0ZB2XbnllUN7_kmz1OHyvb-Vn0FYSSWxY6JyXI03eq0LSBr8cXpK6HkUn9umc14aiiXJPCg0SNKhxSFu9gB806_Ocz6109ytXopDHydsED-OhbhZ1lZKAFmKmM3XFN
    });

    _firebaseMessaging.configure(onMessage: (info) {
      print('====== ON MESSAGE =====');
      print(info);

      String argumento = 'no-data';
      if (Platform.isAndroid) {
        argumento = info['data']['comida'] ?? 'no-data';
      }
      _mensajesStreamController.sink.add(argumento);
    }, onLaunch: (info) {
      print('====== ON LAUNCH =====');
      print(info);
    }, onResume: (info) {
      print('====== ON RESUME =====');
      print(info);
      final notificacion = info['data']['comida'];
      _mensajesStreamController.sink.add(notificacion);
    });
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
