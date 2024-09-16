import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/screens/HomePage.dart';
import 'package:flutter_online_kachehari/screens/SignUpScreen.dart';
import 'package:flutter_online_kachehari/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
