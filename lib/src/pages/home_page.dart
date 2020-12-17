import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notificaciones/src/providers/send_notification.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final enviar = new SendNotification();
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Text('Enviar Notificación'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => enviar.sendNotification(),
        child: Icon(Icons.notifications),
      ),
    );
  }

}
