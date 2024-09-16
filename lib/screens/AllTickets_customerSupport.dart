import 'package:flutter/material.dart';

class AllticketsCustomersupport extends StatefulWidget {
  @override
  State<AllticketsCustomersupport> createState() => _AllticketsCustomersupportState();
}

class _AllticketsCustomersupportState extends State<AllticketsCustomersupport> {
  final List<Map<String, String>> tickets = [
    {'title': 'Login Issue', 'description': 'Unable to login to the account. Error code: 403.', 'status': 'Pending'},
    {'title': 'App Crash', 'description': 'The app crashes on startup. Please fix the issue ASAP.', 'status': 'Resolved'},
    {'title': 'Payment Error', 'description': 'Payment processing error during checkout. Error code: 502.', 'status': 'In Progress'},
    {'title': 'Profile Update Failure', 'description': 'Unable to update user profile details. Please investigate.', 'status': 'Pending'},
    {'title': 'Notification Bug', 'description': 'Notifications are not being received even though they are enabled.', 'status': 'Resolved'},
    {'title': 'Document Access Issue', 'description': 'Unable to access or download documents from the user dashboard.', 'status': 'In Progress'},
    {'title': 'System Lag', 'description': 'System is lagging and performing slowly during peak hours.', 'status': 'Pending'},
    {'title': 'Feedback Submission', 'description': 'General feedback on app performance and user experience.', 'status': 'Resolved'},
    {'title': 'Password Reset Request', 'description': 'Request to reset the password not receiving email instructions.', 'status': 'In Progress'},
    {'title': 'App Update Problem', 'description': 'Problems encountered while updating the app to the latest version.', 'status': 'Pending'},
    {'title': 'Feature Request', 'description': 'Request for a new feature in the app – dark mode.', 'status': 'Resolved'},
    {'title': 'Account Verification', 'description': 'Account verification email not received. Requesting support.', 'status': 'Pending'},
    {'title': 'Error in Data Sync', 'description': 'Data synchronization issues between app and server.', 'status': 'In Progress'},
    {'title': 'Subscription Issue', 'description': 'Problems with subscription renewal and payment.', 'status': 'Resolved'},
    {'title': 'UI Glitch', 'description': 'Visual glitch in the user interface on the settings page.', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Tickets",
          style: TextStyle(
            fontFamily: "serif",
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.9),
                Colors.lightBlue.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: tickets.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          final statusColor = ticket['status'] == 'Resolved'
              ? Colors.green
              : ticket['status'] == 'In Progress'
              ? Colors.orange
              : Colors.red;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Icon(
                Icons.rocket,
                size: 40,
                color: Colors.blue,
              ),
              title: Text(
                ticket['title']!,
                style: const TextStyle(
                  fontFamily: "serif",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                ticket['description']!,
                style: const TextStyle(
                  fontFamily: "serif",
                  fontSize: 16,
                ),
              ),
              trailing: Chip(
                label: Text(
                  ticket['status']!,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: statusColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
