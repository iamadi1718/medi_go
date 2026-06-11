import 'package:flutter/material.dart';
import 'package:medi_go/custombackground/CustomBackground.dart';
import 'package:medi_go/custombutton/CustomButton.dart';

class Onboardinglast extends StatelessWidget {
  const Onboardinglast({super.key});

  @override
  Widget build(BuildContext context) {
    return Custombackground(
      widget: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/splash.png'),
              OutlinedButton(onPressed: (){}, child:Text('Skip'))
            ],
          ),
          Image.asset('assets/images/onboard3.png'),
          Text('Secure & Verified',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),),
          Text('Trusted medical care, made simple. Verified\n doctors and genuine prescriptions at your\n fingertips.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          Custombutton(text: 'Login/SignUp Now', onTaps: () { 
            
           },),
        ],
      )
    );
 }
}