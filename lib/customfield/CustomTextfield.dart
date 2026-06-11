import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key, required this.icon, required this.text});
  final Icon icon;
  final String text;


  @override
  Widget build(BuildContext context) {
   return Container(
     height: 34,
     margin: EdgeInsets.all(16),
     padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
     width: 300,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(32),
     ),
     child:TextFormField(
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: text,
      ),
     )
   );
  
  }
}