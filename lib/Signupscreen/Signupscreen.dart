import 'package:flutter/material.dart';
import 'package:medi_go/custombutton/CustomButton.dart';
import 'package:medi_go/customfield/CustomTextfield.dart';
import 'package:medi_go/loginscreen/LoginScreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff005c67), Color(0xff00b8cd)],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/splash.png'),
              OutlinedButton(onPressed: () {}, child: Text('Skip')),
            ],
          ),
          Text(
            'Create Your Account',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          Text('Join our community for verified medical uses.'),
          Customtextfield(icon: Icon(Icons.person), text: 'Full Name'),
          Customtextfield(icon: Icon(Icons.phone), text: 'Enter phone number'),
          Customtextfield(
            icon: Icon(Icons.mail),
            text: 'Enter Your email address',
          ),
          Customtextfield(icon: Icon(Icons.lock), text: 'Create Password'),
          Customtextfield(icon: Icon(Icons.lock), text: 'Confirm Password'),
          Custombutton(
            text: 'Sign up',
            onTaps: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Loginscreen()),
              );
            },
          ),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.white70, thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Or connect with",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              Expanded(child: Divider(color: Colors.white70, thickness: 1)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/google.png', height: 36, width: 36),
              SizedBox(width: 10),
              Image.asset('assets/images/apple.png', height: 36, width: 36),
            ],
          ),
          Row(
            children: [
              Text('Already have an account ? '),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginscreen()),
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
        ],
      ),
    );
  }
}
