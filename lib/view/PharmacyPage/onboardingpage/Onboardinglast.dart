import 'package:flutter/material.dart';
import 'package:medi_go/view/custombackground/CustomBackground.dart';
import 'package:medi_go/view/custombutton/CustomButton.dart';
import 'package:medi_go/view/loginscreen/LoginScreen.dart';

class Onboardinglast extends StatelessWidget {
  const Onboardinglast({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Custombackground(
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
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
                SizedBox(height: 170),
                Image.asset('assets/images/onboard3.png'),
                SizedBox(height: 120),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Secure & Verified',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your all-in-one health app. Consult doctors, order\n medicines, and track wellness.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Custombutton(
                  text: 'LogIn/SignUp Now',
                  onTaps: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
