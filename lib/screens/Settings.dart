import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",style: TextStyle(fontFamily: "serif",fontSize: 21,fontWeight: FontWeight.bold),),

        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.withOpacity(0.9),
                Colors.lightBlue.withOpacity(0.3),
              ])
          ),
        ),
      ),
        body: SettingsScreen(),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
          ),
        ),
      );

  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _receiveNotifications = true;
  bool _receiveOffers = false;
  bool _receiveAppUpdates = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            _buildSettingsCard(
              title: 'Change Password',
              content: Column(
                children: <Widget>[
                  _buildTextField('Current Password'),
                  const SizedBox(height: 10),
                  _buildTextField('New Password'),
                  const SizedBox(height: 10),
                  _buildTextField('Confirm New Password'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Change this to any color you want
                    ),
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),


            _buildSettingsCard(
              title: 'Change Language',
              content: DropdownButtonFormField<String>(
                items: ['English', 'Hindi']
                    .map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (String? value) {

                },
                decoration: InputDecoration(labelText: 'Select Language'),
              ),
            ),
            SizedBox(height: 12.0),


            _buildSettingsCard(
              title: 'Notification Settings',
              content: Column(
                children: <Widget>[
                  _buildSwitch('Receive Notifications', _receiveNotifications,
                          (bool value) {
                        setState(() {
                          _receiveNotifications = value;
                        });
                      }),
                  _buildSwitch('Receive Offer Notifications', _receiveOffers,
                          (bool value) {
                        setState(() {
                          _receiveOffers = value;
                        });
                      }),
                  _buildSwitch('Receive App Update Notifications',
                      _receiveAppUpdates, (bool value) {
                        setState(() {
                          _receiveAppUpdates = value;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a card
  Widget _buildSettingsCard({required String title, required Widget content}) {
    return Card(
      elevation: 4.0,
      color: Theme.of(context).cardColor, // Card color adapts to the theme
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            content,
          ],
        ),
      ),
    );
  }


  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }


  Widget _buildSwitch(
      String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
