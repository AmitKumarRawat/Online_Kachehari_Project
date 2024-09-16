import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(FeedsPage());

class FeedsPage extends StatefulWidget {
  FeedsPage({super.key});

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  String currentUserName = "John Doe";

  List<Map<String, String>> data = [
    {
      "title": "Ritesh",
      "subtitle": "date.past",
      "image": "assets/images/f_img.jpeg",
      "username": "Ritesh"
    },
    {
      "title": "Anime Enthusiast",
      "subtitle": "yesterday",
      "image": "assets/images/f_img.jpeg",
      "username": "Anime Fan"
    },
    {
      "title": "Tech Blogger",
      "subtitle": "today",
      "image": "assets/images/f_img.jpeg",
      "username": "Tech Blogger"
    },
  ];

  File? _image;
  final picker = ImagePicker();

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addNewPost() {
    if (titleController.text.isNotEmpty || subtitleController.text.isNotEmpty) {
      setState(() {
        data.insert(0, {
          "title": titleController.text,
          "subtitle": subtitleController.text,
          "image": _image?.path ?? "assets/images/default.jpg",
          "username": currentUserName,
        });
      });
      titleController.clear();
      subtitleController.clear();
      _image = null;
    }
  }

  // Function to delete a post from the list
  void _deletePost(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  // Function to handle back button (customize according to your need)
  void _handleBackPress() {
    Navigator.pop(context); // You can modify this if you want to go back to a specific page.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Feeds App",
      theme: ThemeData(fontFamily: "Open Sans"),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Feeds"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back), // Back arrow icon
              onPressed: _handleBackPress,  // Define back action
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/images/f_img.jpeg"),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                controller: subtitleController,
                                decoration: InputDecoration(
                                  hintText: "Write your thoughts...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildPostButton(Icons.photo, "Media", Colors.blue),
                          ElevatedButton(
                            onPressed: _addNewPost,
                            child: Text("Post"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[300],
                    thickness: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Card(
                      elevation: 10,
                      color: Colors.transparent.withOpacity(0.9),
                      child: Container(
                        height: 350,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(),
                              title: Text(item["username"] ?? ""),
                              subtitle: Text(item["subtitle"] ?? ""),
                              trailing: PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == "Delete") {
                                    _deletePost(index);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: "Delete",
                                    child: Text("Delete"),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: item["image"] != null
                                        ? FileImage(File(item["image"] ?? ''))
                                        : AssetImage('assets/images/default.jpg')
                                    as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 14.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.thumb_up, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text("Like", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.comment, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text("Comments", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.share, color: Colors.grey),
                                    SizedBox(width: 8),
                                    Text("Share", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostButton(IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: _pickImage,
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(color: Colors.grey[800], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
