import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // List of fake notification data using map
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'subtitle': 'You have received a new message from John',
      'date': '23-01-2021'
    },
    {
      'title': 'App Update',
      'subtitle': 'Version 2.0 is available for download',
      'date': '22-01-2021'
    },
    {
      'title': 'Event Reminder',
      'subtitle': 'Meeting with HR at 10 AM',
      'date': '21-01-2021'
    },
    {
      'title': 'Security Alert',
      'subtitle': 'Unusual login detected in your account',
      'date': '20-01-2021'
    },
    {
      'title': 'Payment Received',
      'subtitle': 'Your payment of INR 500 has been processed',
      'date': '19-01-2021'
    },
    {
      'title': 'Promotion',
      'subtitle': 'Congratulations! You have been promoted to Senior Manager',
      'date': '18-01-2021'
    },
    {
      'title': 'Appointment Scheduled',
      'subtitle': 'Your dentist appointment is confirmed for 25-01-2021',
      'date': '17-01-2021'
    },
    {
      'title': 'New Connection',
      'subtitle': 'You have a new connection request from Sarah',
      'date': '16-01-2021'
    },
    {
      'title': 'System Maintenance',
      'subtitle': 'Scheduled system maintenance on 26-01-2021',
      'date': '15-01-2021'
    },
    {
      'title': 'Password Change',
      'subtitle': 'Your password was successfully changed',
      'date': '14-01-2021'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Text("Notifications", style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: Icon(
                  Icons.notification_add,
                  color: Colors.white,
                  size: 30,
                )),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Text(
                  notifications.length.toString(), // Dynamic count
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications_active, color: Colors.deepPurple),
            title:
                Text(notifications[index]['title']!), // Dynamic title from map
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notifications[index]
                    ['subtitle']!), // Dynamic subtitle from map
                SizedBox(height: 4), // Small space between subtitle and date
                Text(
                  notifications[index]['date']!,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ), // Dynamic date from map
              ],
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              // Action to perform when tapped
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(notifications[index]['title']!),
                    content: Text(notifications[index]['subtitle']!),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
