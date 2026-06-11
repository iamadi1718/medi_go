import 'package:flutter/material.dart';
import 'package:medi_go/custombackground/CustomBackground.dart';
import 'package:medi_go/custombutton/CustomButton.dart';

class Onboardingnext extends StatelessWidget {
  const Onboardingnext({super.key});

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
          Image.asset('assets/images/onboard2.png'),
          Text('Healthcare On-Demand',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),),
          Text('Healthcare on-demand, anywhere. Fast access\n to specialists and diagnostics.',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          Custombutton(text: 'Next', onTaps: () { 
            
           },),
        ],
      )
    );
 }
}