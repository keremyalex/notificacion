import 'dart:convert';

import 'package:http/http.dart' as http;

class SendNotification {
  Future<bool> sendNotification() async {
    String url = 'https://fcm.googleapis.com/fcm/send';
    final data = jsonEncode({
      "to":
          "fvj1wTxTRSyFcJPEZvzGms:APA91bH9RbYifM0ZB2XbnllUN7_kmz1OHyvb-Vn0FYSSWxY6JyXI03eq0LSBr8cXpK6HkUn9umc14aiiXJPCg0SNKhxSFu9gB806_Ocz6109ytXopDHydsED-OhbhZ1lZKAFmKmM3XFN",
      "notification": {"title": "Notificacion Flutter", "body": "Body desde Peticion Post"},
      "data": {"comida": "Comida desde Peticion Post"}
    });
    final resp = await http.post(url,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization":
              "key=	AAAAkIck6zs:APA91bFLYUhLosfKy07X10hhhOOpcBcaQx4SbyjCq-NEOTmdOqxQrXFM-GnpODMqKpiev3plrSpjkNSJb2NwqPESVpgyeOjQ9GSlafllBVR1WwNY69_pDmqm4WASJ4-fkbDvE1TniJ2U"
        },
        body: data);
    if (resp.statusCode == 200) {
      print('Se envio la notificacion');
      print(resp.statusCode);
      return true;
    } else {
      print('Fallo al enviar la notificacion');
      print(resp.statusCode);
      return false;
    }
  }
}
