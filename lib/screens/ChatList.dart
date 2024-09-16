import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
 var liveAdvocates = [
    {"name": "Awnish Kumar", "status": "live"},
    {"name": "Ashish Kumar", "status": "recent"},
    {"name": "Kundan Kumar", "status": "offline"},
    {"name": "Kuldeep", "status": "live"},
    {"name": "Nihal Jain", "status": "live"},
    {"name": "Pranav Kumar", "status": "recent"},
    {"name": "Kundan Kumar", "status": "recent"},
    {"name": "Om Kumar", "status": "live"},
    {"name": "Chandan Kumar", "status": "off"},
    {"name": "Lolly Kumar", "status": "offline"},
    {"name": "Ram Kumar", "status": "live"},
    {"name": "Anita Sharma", "status": "live"},
    {"name": "Suman Singh", "status": "offline"},
    {"name": "Rajesh Verma", "status": "recent"},
    {"name": "Neha Patel", "status": "live"},
    {"name": "Gaurav Sinha", "status": "live"},
    {"name": "Ravi Gupta", "status": "recent"},
    {"name": "Pooja Rani", "status": "live"},
    {"name": "Amit Kumar", "status": "offline"},
    {"name": "Sunita Devi", "status": "live"},
    {"name": "Ramesh Yadav", "status": "recent"}
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Chat Now '),
        ),
        body: Center(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Card(elevation: 3,
                shape: CircleBorder(),
                  child: Icon(Icons.person,size: 45,)),
                title: Text(liveAdvocates[index]["name"]!),
                titleTextStyle: TextStyle(color: Colors.blue),
                subtitle: Text(liveAdvocates[index]["status"]!),
              );
            },
            itemCount: (liveAdvocates.length > 0) ? liveAdvocates.length : 0,
            scrollDirection: Axis.vertical,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey,
                thickness: 0.5,
              );
            },
          ),
        ));
  }
}
