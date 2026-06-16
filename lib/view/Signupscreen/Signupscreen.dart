import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medi_go/view/addresspage/Addaddresspage.dart';
import 'package:medi_go/view/custombutton/CustomButton.dart';
import 'package:medi_go/view/customfield/CustomTextfield.dart';
import 'package:medi_go/view/loginscreen/LoginScreen.dart';
import 'package:medi_go/view/utils/Utils.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff005c67), Color(0xff00b8cd)],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/crossing.png',
                        width: 40,
                        height: 40,
                      ),
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
                  SizedBox(height: 30),
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Join our community for verified medical uses.',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Customtextfield(
                          icon: Icon(Icons.person),
                          text: 'Full Name',
                          controller: nameController,
                        ),
                        Customtextfield(
                          icon: Icon(Icons.phone),
                          text: 'Enter phone number',
                          controller: phoneController,
                        ),
                        Customtextfield(
                          icon: Icon(Icons.mail),
                          text: 'Enter Your email address',
                          controller: emailController,
                        ),
                        Customtextfield(
                          icon: Icon(Icons.lock),
                          text: 'Create Password',
                          controller: passwordController,
                        ),
                        Customtextfield(
                          icon: Icon(Icons.lock),
                          text: 'Confirm Password',
                          controller: confirmPasswordController,
                        ),
                        Custombutton(
                          text: 'Sign up',
                          onTaps: () {
                            if (_formkey.currentState!.validate()) {
                              _auth.createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString(),
                              ).then((value){
                                Utils().toastmessage(value.user!.email.toString());
                                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addaddresspage(),
                              ),
                            );
                              }).onError((error,stackTrace){
                                 Utils().toastmessage(error.toString());
                              });
                            }
                           
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.white70, thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  SizedBox(height: 20),

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
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginscreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
