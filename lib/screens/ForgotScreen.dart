import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/screens/alert.dart';

import 'Login_Screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _emailCheckController = TextEditingController();
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/images/logo.png',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.45),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(54),
                          bottomRight: Radius.circular(54)),
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        'Forgot password',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'serif',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      // email code here

                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          child: Container(
                            width: 270,
                            child: TextField(
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
                              keyboardType: TextInputType.visiblePassword,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'serif'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          submit_check();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue, elevation: 2),
                        child: const Text(
                          "Submit",
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
                                width: 21,
                              ),
                              const Text(
                                'Back to login  ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'serif',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const Login_Screen();
                                    }));
                                  },
                                  child: const Center(
                                    child: Icon(Icons.home, size: 32),
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
      ),
    );
  }

  void submit_check() {
    String checkRes = _emailCheckController.text;
    if (checkRes == "") {
      showAlert(context, "Please Enter require field ");
    }
  }
}
