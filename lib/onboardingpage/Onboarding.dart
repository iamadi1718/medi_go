import 'package:flutter/material.dart';
import 'package:medi_go/custombackground/CustomBackground.dart';
import 'package:medi_go/custombutton/CustomButton.dart';
import 'package:medi_go/onboardingpage/Onboardingnext.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Custombackground(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/splash.png'),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {},
                    child: Text('Skip', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 170),
              Image.asset('assets/images/onboard1.png'),
              SizedBox(height: 120),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Health, All in One Place',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your all-in-one health app. Consult doctors, order\n medicines, and track wellness.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Custombutton(
                text: 'Get Started!',
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboardingnext()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
