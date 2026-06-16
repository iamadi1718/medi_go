import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:medi_go/view/Signupscreen/Signupscreen.dart';
import 'package:medi_go/view/custombackground/CustomBackground.dart';
import 'package:medi_go/view/custombutton/CustomButton.dart';
import 'package:medi_go/view/customfield/CustomTextfield.dart';
import 'package:medi_go/view/homepage/Homepage.dart';
import 'package:medi_go/view/utils/Utils.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Custombackground(
        widget: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/splash.png'),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 140),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Log in to access your verified healthcare profile.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Customtextfield(
                        icon: Icon(Icons.email),
                        text: 'Enter your email/phone number',
                        controller: emailcontroller,
                      ),
                      Customtextfield(
                        icon: Icon(Icons.lock),
                        text: 'Enter your password',
                        controller: passwordcontroller,
                      ),

                      Custombutton(
                        text: 'Login',
                        onTaps: () {
                          if (_formkey.currentState!.validate()) {
                            _auth
                                .signInWithEmailAndPassword(
                                  email: emailcontroller.text.toString(),
                                  password: passwordcontroller.text.toString(),
                                )
                                .then((value) {
                                  Utils().toastmessage(
                                    value.user!.email.toString(),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homepage(),
                                    ),
                                  );
                                })
                                .onError((error, stackTrace) {
                                  Utils().toastmessage(error.toString());
                                });
                          }
                        },
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.white70, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Or connect with",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.white70, thickness: 1),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Google.png',
                      height: 36,
                      width: 36,
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      'assets/images/apple.png',
                      height: 36,
                      width: 36,
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      'assets/images/Third.png',
                      height: 36,
                      width: 36,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signupscreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
