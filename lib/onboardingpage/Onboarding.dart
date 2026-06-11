import 'package:flutter/material.dart';
import 'package:medi_go/custombackground/CustomBackground.dart';
import 'package:medi_go/custombutton/CustomButton.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
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
          Image.asset('assets/images/onboard1.png'),
          Text('Your Health, All in One Place',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),),
          Text('Your all-in-one health app. Consult doctors, order\n medicines, and track wellness.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          Custombutton(text: 'Get Started!', onTaps: () { 
            
           },),
        ],
      )
    );
  }
}