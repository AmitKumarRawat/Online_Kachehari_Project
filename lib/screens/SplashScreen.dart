import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/screens/HomePage.dart';
import 'package:flutter_online_kachehari/screens/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  static const String statusToGo = 'isLogin';
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',color: Colors.black,
            height: 150,
          ),
         const SizedBox(
            height: 3,
          ),
        const  Text(
            'Online Kachehri',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: 'serif'),
          ),
        ],
      ),
    ));
  }
  
  void whereToGo()async {
    //for direct redirecting at home page

    var sharedPref = await SharedPreferences.getInstance();
    var loginCheck = sharedPref.getBool(statusToGo);
    if(loginCheck==true){ 
      print('true condition run here ');
      WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return  HomePage();
        }));
      });
    });
    }else{
      WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const Login_Screen();
        }));
      });
    });
    }
  }
}
