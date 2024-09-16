import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/screens/ChatScreen.dart';

class Livewakeels extends StatefulWidget {
  @override
  State<Livewakeels> createState() => _LivewakeelsState();
}

class _LivewakeelsState extends State<Livewakeels> {
  final List<Map<String, dynamic>> _items = [
    {
      'realName': 'John Doe',
      'subtitle': 'Live now',
      'chatStatus': 'Chat Now',
      'icon': Icons.person,
      'isOnline': true,
    },
    {
      'realName': 'Jane Smith',
      'subtitle': 'Offline',
      'chatStatus': 'Chat later',
      'icon': Icons.person,
      'isOnline': false,
    },
    {
      'realName': 'Michael Brown',
      'subtitle': 'Live now',
      'chatStatus': 'Chat Now',
      'icon': Icons.person,
      'isOnline': true,
    },
    {
      'realName': 'Emily Davis',
      'subtitle': 'Offline',
      'chatStatus': 'Chat later',
      'icon': Icons.person,
      'isOnline': false,
    },
    {
      'realName': 'Chris Johnson',
      'subtitle': 'Live now',
      'chatStatus': 'Chat Now',
      'icon': Icons.person,
      'isOnline': true,
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Live Advocates",
          style: TextStyle(
            fontFamily: "serif",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(item['icon'], color: Colors.white),
              ),
              title: Text(
                item['realName'],
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item['subtitle'],
                style: TextStyle(
                  color: item['isOnline'] ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                item['chatStatus'],
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 16,
                  color: item['isOnline'] ? Colors.blue : Colors.grey,
                ),
              ),
              onTap: () {
                if (!item['isOnline']) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}