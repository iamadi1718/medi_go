import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medi_go/custombackground/CustomBackground.dart';
import 'package:medi_go/onboardingpage/Onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Custombackground(
      widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Image.asset('assets/images/splash.png',
         height: 123,
         width: 144,
         ),
         Spacer(),
         Text('MediGo',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,letterSpacing: -0.24,),)
      ],
    ),
    );
   
  }
}

    