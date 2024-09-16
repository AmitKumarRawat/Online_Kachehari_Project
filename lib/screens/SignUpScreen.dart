import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/components/toaster/toast.dart';
import 'package:flutter_online_kachehari/screens/Login_Screen.dart';
import 'package:flutter_online_kachehari/screens/alert.dart';
import '../api/constants/Urls.dart';
import '../components/update_profile/editForm.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _controllerFor_name = TextEditingController();
  final _controllerFor_email = TextEditingController();
  final _controllerFor_mobile = TextEditingController();
  final _controllerFor_password = TextEditingController();
  final _controllerFor_second_password = TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  late String _selectedGender;

  void _handleGenderChange(String? value) {
    setState(() {
      _selectedGender = value ?? 'Male'; // Update state
    });
  }

  @override
  void initState() {
    super.initState();
    _controllerFor_name.text = "";
    _controllerFor_email.text = "";
    _controllerFor_mobile.text = "";
    _controllerFor_password.text = "";
    _controllerFor_second_password.text = "";
    _selectedGender = "Male";
  }
  String _signUp_res = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
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
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.99,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.45),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(54),
                        topRight: Radius.circular(54)),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'serif',
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    // name code is here
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: _controllerFor_name,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              hintText: 'Enter your name',
                              labelText: 'Name',
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

                    // email code here

                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: _controllerFor_email,
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

                    // mobile code is here

                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          width: 300,
                          child: TextField(
                            controller: _controllerFor_mobile,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.call),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              hintText: 'Enter your mobile no',
                              labelText: 'Mobile',
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
                            keyboardType: TextInputType.phone,
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
                        elevation: 4,
                        child: Container(
                          width: 300,
                          child: TextField(
                            obscureText: true,
                            controller: _controllerFor_password,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password_sharp),
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
                    //

                    //  confirm password code is here
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          width: 300,
                          child: TextField(
                            obscureText: true,
                            controller: _controllerFor_second_password,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password_rounded),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              prefixIconColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none),
                              hintText: 'Confirm your password',
                              labelText: 'Confirm-Password',
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
                    //Radio for male and female
                    //Radio
                    Container(
                      height: 70,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: [
                          Card(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                              ), 
                              height: 60,
                              width: 300,
                              child:const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.arrow_upward_rounded,color: Colors.grey,size: 40,),
                                   Text(
                                    "Swipe up to select gender",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'serif',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(Icons.person_3,color: Colors.grey,size: 32,),
                                ],
                              ),
                            ),
                          ),
                        const  SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: editForm(
                                "",
                                Icons.male,
                                TextInputType.text,
                                _genderController,
                                true,
                                'Male',
                                'Male',
                                _selectedGender,
                                _handleGenderChange),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: editForm(
                                "",
                                Icons.male,
                                TextInputType.text,
                                _genderController,
                                true,
                                'Female',
                                'Female',
                                _selectedGender,
                                _handleGenderChange),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: editForm(
                                "",
                                Icons.male,
                                TextInputType.text,
                                _genderController,
                                true,
                                'Other',
                                'Other',
                                _selectedGender,
                                _handleGenderChange),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        sign_up_result_page();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, elevation: 2),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontFamily: "serif",
                            fontSize: 21,
                            color: Colors.white),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 2,
                            ),
                            const Text(
                              'Already have account? ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'serif',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const Login_Screen();
                                  }));
                                },
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontFamily: 'serif',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ))
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
    );
  }

  void sign_up_result_page() async {
    String name = _controllerFor_name.text;
    String email = _controllerFor_email.text;
    String password = _controllerFor_password.text;
    String mobile = _controllerFor_mobile.text;
    String cnf_password = _controllerFor_second_password.text;
    String gender = _selectedGender;
    //Validation name
    if (name.trim() == "") {
      showAlert(context, "name is required");
      return;
    }
    //Validation Email
    if (email.trim() == "") {
      showAlert(context, "Email is required");
      return;
    }

    //Validation mobile
    if (mobile.trim() == "") {
      showAlert(context, "Mobile is required");
      return;
    }

    //Validation password
    if (password.trim() == "") {
      showAlert(context, "Password is required");
      return;
    }

    //Validation cnf_password
    if (cnf_password.trim() == "") {
      showAlert(context, "Confirm Password is required");
      return;
    }

    if (password == cnf_password) {
      //Ready to Submit
      final Dio dio = Dio();
      Response response;

      var userdata = {
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "gender": gender,
      };

      final formData = FormData.fromMap(userdata);

      try {
        response =
            await dio.post(Urls().getApiUrl("create_users"), data: formData);

        // Print response details
        print('Status data String ===> ${response.data.toString()}');
        print('Status code ===> ${response.statusCode}');

        // Handle JSON Response
        Map<String, dynamic> userResponse = json.decode(response.toString());
        print('userResponse ===> ${userResponse}');
        dynamic code = userResponse["code"];
        dynamic message = userResponse["message"];
        dynamic data = userResponse["data"];

        print("http status code : ${code}");

        if (code == 201) {
          // showAlert(context, "Register Success");
          showToaster("Register Success");
          Timer(const Duration(seconds: 3), () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) {
                return Login_Screen();
              },
            ));
          });
        } else if (code == 200) {
          showAlert(context, "User Already Exist, Please Login ");
        } else {
          showAlert(context, "Unexpected response code: $code");
        }
      } on DioException catch (e) {
        // Handle Dio specific exceptions
        if (e.response != null) {
          print('DioException response: ${e.response}');

          showAlert(context,
              "Error: ${e.response?.statusCode} - ${e.response?.statusMessage}");
        } else {
          // If there is no response object in the exception
          print('DioException error: ${e.message}');
          showAlert(context, "Network Error: ${e.message}");
        }
      } catch (e) {
        // Handle other exceptions
        print('General exception: $e');
        showAlert(context, "Unexpected Error: $e");
      }
    } else {
      showAlert(context, "Password and Confirm Password Does not Match");
      return;
    }
  }
}
