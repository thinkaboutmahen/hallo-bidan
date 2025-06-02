import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    "Notifikasi 1",
    "Notifikasi 2",
    "Notifikasi 3",
    "Notifikasi 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notifications[index]),
              trailing: Icon(Icons.notifications),
            ),
          );
        },
      ),
    );
  }
}

