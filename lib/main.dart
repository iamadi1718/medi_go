import 'package:flutter/material.dart';

import 'package:medi_go/splashscreen/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Splashscreen(),

      debugShowCheckedModeBanner: false,
     

    );
  }
}
