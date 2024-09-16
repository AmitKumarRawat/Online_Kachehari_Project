// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/api/constants/Urls.dart';
import 'package:flutter_online_kachehari/api/interface/DioHelper.dart';
import 'package:flutter_online_kachehari/components/toaster/toast.dart';
import 'package:flutter_online_kachehari/screens/ForgotScreen.dart';
import 'package:flutter_online_kachehari/screens/HomePage.dart';
import 'package:flutter_online_kachehari/screens/SignUpScreen.dart';
import 'package:flutter_online_kachehari/screens/alert.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final _TextFeildController_for_username = TextEditingController();
  final _TextFeildController_for_password = TextEditingController();
  late String _result_Login;
  late bool _showPassword;

  @override
  void initState() {
    super.initState();
    _TextFeildController_for_username.text = "";
    _TextFeildController_for_password.text = "";
    _showPassword = false;
    _result_Login = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 27,
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Online Kachehari',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'cursive',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'serif',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.84,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.55),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(54),
                        topRight: Radius.circular(54),
                      ),
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 55,
                      ),

                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'serif',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      // email code is here
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          child: Container(
                            width: 270,
                            child: TextField(
                              controller: _TextFeildController_for_username,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                prefixIconColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide.none),
                                hintText: 'Enter your E-mail',
                                labelText: 'E-mail',
                                labelStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'serif'),
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'serif',
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'serif'),
                            ),
                          ),
                        ),
                      ),

                      // password code is here
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 4,
                          child: Container(
                            width: 270,
                            child: TextField(
                              obscureText: _showPassword ? false : true,
                              controller: _TextFeildController_for_password,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: _showPassword
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                ),
                                prefixIcon: const Icon(Icons.person),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                prefixIconColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide.none),
                                hintText: 'Enter your password',
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'serif'),
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'serif',
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'serif'),
                            ),
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ForgotScreen();
                              }));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'serif',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          login_result();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue, elevation: 2),
                        child: const Text(
                          "Login ",
                          style: TextStyle(
                              fontFamily: "serif",
                              fontSize: 21,
                              color: Colors.white),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(height: 55),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 61,
                              ),
                              const Text(
                                'Dont have account? ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'serif',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return SignupScreen();
                                    }));
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Sign Up ',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontFamily: 'serif',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void login_result() {

    String username = _TextFeildController_for_username.text;
    String password = _TextFeildController_for_password.text;

    //validation for username
    if(username.trim() == ""){
      showAlert(context,"Username is Required");
      return;
    }

    //validation for password
    if(password.trim() == ""){
      showAlert(context,"Password is Required");
      return;
    }

    if(username.trim()!="" && password.trim()!=""){
        final _dio = new Dio();
        DioHelper dioHelper = new DioHelper(_dio);
         var userdata = {
        "username": username,
        "password": password,

      };
    try{
      final formData = FormData.fromMap(userdata);
      final loginResponse = dioHelper.post(Urls().getApiUrl("user_login"),formData);
       print('Response ==> ${loginResponse.toString()}');
          showToaster('Response ==> ${loginResponse.toString()}');

      dynamic response = dioHelper.responseDecoder(loginResponse);


    }
    on DioException  catch(e){
          print('Dioexception  exception: ${e.response.toString()}');
          showToaster('Dio exception occurred : ${e.response.toString()}');
    }
    catch(error){
          print('un_caught exception : ${error.toString()}');
          showToaster('un_caught exception : ${error.toString()}');
    }
      return;
     }


  }
}
