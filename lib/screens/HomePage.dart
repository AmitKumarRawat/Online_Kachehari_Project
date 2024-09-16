import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/components/update_profile/edit.dart';
import 'package:flutter_online_kachehari/screens/CustomerSupport.dart';
import 'package:flutter_online_kachehari/screens/Feeds.dart';
import 'package:flutter_online_kachehari/screens/LiveWakeels.dart';
import 'package:flutter_online_kachehari/screens/Login_Screen.dart';
import 'package:flutter_online_kachehari/screens/Notification.dart';
import 'package:flutter_online_kachehari/screens/Policy.dart';
import 'package:flutter_online_kachehari/screens/ProfileScreen.dart';
import 'package:flutter_online_kachehari/screens/Services.dart';
import 'package:flutter_online_kachehari/screens/Settings.dart';
import 'package:flutter_online_kachehari/screens/TermsConditions.dart';
import 'package:flutter_online_kachehari/screens/TrendingBlogs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //fake notification
  final List<Map<String, String>> notifications = [
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
    {
      'title': 'Username Change',
      'subtitle': 'Your username was successfully changed',
      'date': '13-02-2022'
    },
  ];

  // Fake data for Drawer menu items
  final List<Map<String, dynamic>> drawerItems = [
    {'icon': Icons.person, 'title': 'Profile'},
    {'icon': Icons.description_outlined, 'title': 'Blog'},
    {'icon': Icons.person, 'title': 'About Us'},
    {'icon': Icons.person, 'title': 'Contact Us'},
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.privacy_tip, 'title': 'Privacy Policies'},
    {'icon': Icons.payment, 'title': 'Payments'},
    {'icon': Icons.work, 'title': 'Services'},
    {'icon': Icons.gavel, 'title': 'Terms and Conditions'},
    {'icon': Icons.help, 'title': 'Help and Support'},
    {'icon': Icons.logout, 'title': 'Logout'},
  ];

  // Fake data for Top Trending items
  final List<Map<String, dynamic>> trendingItems = [
    {'icon': Icons.trending_up, 'title': 'Law Updates'},
    {'icon': Icons.trending_up, 'title': 'Legal News'},
    {'icon': Icons.trending_up, 'title': 'Court Hearings'},
    {'icon': Icons.trending_up, 'title': 'Case Studies'},
    {'icon': Icons.trending_up, 'title': 'New Amendments'},
  ];

  // Fake data for Live Advocates
  final List<Map<String, dynamic>> liveAdvocates = [
    {'name': 'Advocate A', 'icon': Icons.person},
    {'name': 'Advocate B', 'icon': Icons.person},
    {'name': 'Advocate C', 'icon': Icons.person},
    {'name': 'Advocate D', 'icon': Icons.person},
    {'name': 'Advocate E', 'icon': Icons.person},
  ];

  // Fake data for Other Services
  final List<Map<String, dynamic>> otherServices = [
    {'icon': Icons.miscellaneous_services, 'title': 'Legal Advice'},
    {'icon': Icons.miscellaneous_services, 'title': 'Document Review'},
    {'icon': Icons.miscellaneous_services, 'title': 'Consultation'},
    {'icon': Icons.miscellaneous_services, 'title': 'Representation'},
    {'icon': Icons.miscellaneous_services, 'title': 'Case Filing'},
  ];

  // Fake data for search suggestions
  final List<String> searchSuggestions = [
    'Advocate A',
    'Legal News',
    'Law Updates',
    'Court Hearings',
    'Case Studies'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Matching app bar color
        title: Stack(
          children: [
            Text('Online Kachehari',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ));
        }),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ), // Changed to notification icon
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationPage()));
                  // Add notification functionality here
                },
              ),
              Positioned(
                child: Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.fromLTRB(7, 8, 20, 20),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 5,
                    minHeight: 5,
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
              // Positioned(
              //   child: Container(
              //     margin: EdgeInsets.fromLTRB(0, 5, 20, 20),
              //     padding: EdgeInsets.all(2),
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     constraints: BoxConstraints(
              //       minWidth: 5,
              //       minHeight: 5,
              //     ),
              //     child: Text(
              //       notifications.length.toString(), // Dynamic count
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 12,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Matching drawer color
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Online Kachehari',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ...drawerItems.map((item) {
              return ListTile(
                minTileHeight: 5,
                leading: Icon(item['icon'], color: Colors.deepPurple),
                title: Text(item['title']),
                onTap: () {
                  if (item['title'] == 'Profile') {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Edit()));
                  } else if (item['title'] == 'Blog') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrendingBlogs()));
                  } else if (item['title'] == 'About Us') {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('About Us'),
                        ),
                        body: Center(
                          child: Text('About Us Page'),
                        ),
                      );
                    }));
                  } else if (item['title'] == 'Contact Us') {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('Contact Us'),
                        ),
                        body: Center(
                          child: Text('Contact Us Page'),
                        ),
                      );
                    }));
                  } else if (item['title'] == 'Settings') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage()));
                  } else if (item['title'] == 'Privacy Policies') {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Policy()));
                  } else if (item['title'] == 'Payments') {
                    // Add navigation to payments page
                  } else if (item['title'] == 'Services') {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Services()));
                  } else if (item['title'] == 'Terms and Conditions') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TermsConditions()));
                  } else if (item['title'] == 'Help and Support') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Customersupport()));
                  } else if (item['title'] == 'Logout') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login_Screen()));
                  }
                },
              );
            }).toList(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar with fake suggestions
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return searchSuggestions.where((String suggestion) {
                    return suggestion
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  print('You selected: $selection');
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              // Top Trending Section
              Row(
                children: [
                  Text('Top Legal Trends',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Add navigation to top legal trends page
                    },
                    child: Text('View All'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 161,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingItems.length,
                  separatorBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.only(right: 0));
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.deepPurple[100],
                                    child: Icon(trendingItems[index]['icon'],
                                        size: 30, color: Colors.deepPurple),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  trendingItems[index]['title'],
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Add navigation to trending item details
                              },
                              child: Text('View Details'),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Top Advocates',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Add navigation to top advocates page
                    },
                    child: Text('View All'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 161,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveAdvocates.length,
                  separatorBuilder: (context, index) => SizedBox(width: 0),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.deepPurple[100],
                                    child: Icon(liveAdvocates[index]['icon'],
                                        size: 30, color: Colors.deepPurple),
                                  ),
                                ),
                                SizedBox(height: 5),
                                // Text(
                                //   liveAdvocates[index]['title'],
                                //   style: TextStyle(fontSize: 14),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Add navigation to trending item details
                              },
                              child: Text('View Details'),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(),
              SizedBox(height: 20),

              // Vakil Logo Section
              Text('Vakil Logo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 4,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/vakil_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Live Advocate Section
              Row(
                children: [
                  Text('Live Advocates',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Livewakeels()));
                    },
                    child: Text('View All'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveAdvocates.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.green[100],
                            child: Icon(liveAdvocates[index]['icon'],
                                size: 30, color: Colors.green),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          liveAdvocates[index]['name'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Other Services Section with Cards
              Text('Other Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: otherServices.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(otherServices[index]['icon'],
                              size: 40, color: Colors.deepPurple),
                          SizedBox(height: 10),
                          Text(otherServices[index]['title']),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              //add social media icons with there links
              Row(
                children: [
                  Text('Follow Us',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.pink,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.youtube,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              //add copy right text
              Row(
                children: [
                  Text('© 2024 Online Kachehari. All Rights Reserved.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      )),
                  Spacer(),
                ],
              ),

              // Feedback Form with Star Rating
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        // buttonBackgroundColor: const Color.fromARGB(255, 14, 202, 219),
        color: Colors.deepPurple,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: const Icon(
              Icons.home,
              size: 26,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to FeedPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedsPage()),
              );
            },
            child: Icon(
              Icons.feed,
              size: 26,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
            },
            icon: const Icon(
              Icons.search,
              size: 26,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            icon: const Icon(
              Icons.notifications,
              size: 26,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: const Icon(
              Icons.person,
              size: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
