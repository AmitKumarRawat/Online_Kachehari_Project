import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date and time

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Sample data for live advocates
  final List<Map<String, dynamic>> _items = [
    {
      'realName': 'John Doe',
      'subtitle': 'Live now',
      'icon': Icons.person,
      'isOnline': true
    },
    {
      'realName': 'Jane Smith',
      'subtitle': 'Offline',
      'icon': Icons.person,
      'isOnline': false
    },
    {
      'realName': 'Michael Brown',
      'subtitle': 'Live now',
      'icon': Icons.person,
      'isOnline': true
    },
    {
      'realName': 'Emily Davis',
      'subtitle': 'Offline',
      'icon': Icons.person,
      'isOnline': false
    },
    {
      'realName': 'Chris Johnson',
      'subtitle': 'Live now',
      'icon': Icons.person,
      'isOnline': true
    },
  ];

  // Sample chat messages
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello, John",
        messageType: "receiver",
        senderId: 0,
        timestamp: DateTime.now().subtract(Duration(minutes: 5))),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        senderId: 0,
        timestamp: DateTime.now().subtract(Duration(minutes: 4))),
    ChatMessage(
        messageContent: "Hey Michael, I am doing fine dude. wbu?",
        messageType: "sender",
        senderId: 2,
        timestamp: DateTime.now().subtract(Duration(minutes: 3))),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        senderId: 0,
        timestamp: DateTime.now().subtract(Duration(minutes: 2))),
    ChatMessage(
        messageContent: "Is there anything wrong?",
        messageType: "sender",
        senderId: 2,
        timestamp: DateTime.now().subtract(Duration(minutes: 1))),
  ];

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          messageContent: _messageController.text,
          messageType: "sender",
          senderId:
              2, // Assuming the current user is the sender (Michael Brown in this case)
          timestamp: DateTime.now(),
        ));
        _messageController.clear();
      });
      // Scroll to the bottom after a new message is added
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(width: 2),
                CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _items[2][
                            'realName'], // Assuming you are chatting with Michael Brown
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.circle,
                              color: _items[2]['isOnline']
                                  ? Colors.green[700]
                                  : Colors.red[700],
                              size: 10),
                          SizedBox(width: 5),
                          Text(
                            _items[2]['subtitle'], // Online/Offline status
                            style: TextStyle(
                                color: _items[2]['isOnline']
                                    ? Colors.green[700]
                                    : Colors.red[700],
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSender = message.messageType == "sender";
                final sender = _items[message.senderId];
                return Align(
                  alignment:
                      isSender ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color:
                          isSender ? Colors.blueAccent : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isSender)
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            maxRadius: 15,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.messageContent,
                              style: TextStyle(
                                  color:
                                      isSender ? Colors.white : Colors.black87),
                            ),
                            SizedBox(height: 5),
                            Text(
                              DateFormat('hh:mm a')
                                  .format(message.timestamp), // Display time
                              style: TextStyle(
                                color:
                                    isSender ? Colors.white70 : Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Add functionality for emoji picker
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[200],
                        ),
                        child: Icon(Icons.emoji_emotions_outlined,
                            color: Colors.black, size: 20),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 45,
                      width: 45,
                      child: FloatingActionButton(
                        onPressed: _sendMessage,
                        child: Icon(Icons.send, color: Colors.white, size: 18),
                        backgroundColor: Colors.blueAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String messageContent;
  final String messageType;
  final int senderId;
  final DateTime timestamp;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.senderId,
    required this.timestamp,
  });
}
