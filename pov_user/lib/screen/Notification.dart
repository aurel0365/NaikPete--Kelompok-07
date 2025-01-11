import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          NotificationTile(
            title: 'New Message',
            message: 'You have a new message from John.',
            time: '2 mins ago',
          ),
          NotificationTile(
            title: 'App Update Available',
            message: 'A new update is available for the app.',
            time: '1 hour ago',
          ),
          NotificationTile(
            title: 'System Alert',
            message: 'Your storage is running low.',
            time: 'Yesterday',
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  NotificationTile({required this.title, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(title),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {
        // Handle notification tap (e.g., open detailed view)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Notification tapped!')),
        );
      },
    );
  }
}
