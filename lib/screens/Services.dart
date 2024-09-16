import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Services",style: TextStyle(fontFamily: "serif",fontSize: 21,fontWeight: FontWeight.bold),),

        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.withOpacity(0.9),
                Colors.lightBlue.withOpacity(0.3),
              ])
          ),
        ),
      ),
    );
  }
}
