import 'package:flutter/material.dart';
class Chattingscreen extends StatefulWidget {
  const Chattingscreen({super.key});

  @override
  State<Chattingscreen> createState() => _ChattingscreenState();
}

class _ChattingscreenState extends State<Chattingscreen> {
  final List<ChatMessage> messages = [
    ChatMessage(isUser: false, text: "Hii, welcome in online Kachehari"),
    // Add more messages as needed
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(isUser: true, text: _controller.text));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.lightBlue),
        ),
        title: Text(
          'Live Chat',
          style: TextStyle(
            fontFamily: 'serif',
            color: Colors.black,
          ),
        ),
      ),
      body: Column( 
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border(top: BorderSide(width: 2, color: Colors.white)),
            ),
            height: 80,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Advocate Name',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'online',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: message.isUser
                          ? Colors.blueAccent
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0)),
              elevation: 7,
              child: TextField(
                controller: _controller,
                style: const TextStyle(fontFamily: 'serif', fontSize: 18),
                autocorrect: true,
                showCursor: true,
                onSubmitted: (value) => _sendMessage(),
                decoration: InputDecoration(
                  hintText: "Enter Message",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'serif',
                  ),
                  prefixIcon: const Icon(
                    Icons.emoji_emotions_outlined,
                    size: 32,
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
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
  final bool isUser;
  final String text;

  ChatMessage({required this.isUser, required this.text});
}
