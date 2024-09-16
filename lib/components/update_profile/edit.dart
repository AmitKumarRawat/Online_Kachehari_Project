
import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/components/update_profile/update.dart';


class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile',style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.deepPurple,),
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/user1.png'),
          ),
          const SizedBox(height: 20),
          itemProfile("Name", "Ravi", Icons.person),
          const SizedBox(height: 10),
          itemProfile('Phone', '12345678', Icons.phone),
          const SizedBox(height: 10),
          itemProfile('Email', 'Ravi123@gamil.com', Icons.mail),
          const SizedBox(height: 10),
          itemProfile('Gender', 'Male', Icons.person_3),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Updatepage()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    ));
  }

  itemProfile(String title, String subtitle, IconData icondata) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.blueAccent.withOpacity(.2),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icondata),
        tileColor: Colors.white,
      ),
    );
  }
}
