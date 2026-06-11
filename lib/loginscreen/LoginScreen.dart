import 'package:flutter/material.dart';
import 'package:medi_go/Signupscreen/Signupscreen.dart';
import 'package:medi_go/custombackground/CustomBackground.dart';
import 'package:medi_go/custombutton/CustomButton.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Custombackground(
      widget: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/splash.png'),
              OutlinedButton(onPressed: () {}, child: Text('Skip')),
            ],
          ),
          Text(
            'Welcome Back',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          Text(
            'Log in to access your verified healthcare profile.',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          Custombutton(text: 'Login', onTaps: () {}),

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
              SizedBox(width: 10),
              Image.asset('assets/images/third.png', height: 36, width: 36),
            ],
          ),
          Row(
            children: [
              Text('Don’t have an account ? '),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signupscreen()),
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
    );
  }
}
