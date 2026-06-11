import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.text, required this.onTaps});
  final String text;
  final VoidCallback onTaps;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTaps,
      child: Container(
        height: 34,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
            SizedBox(width: 20,),
            Icon(Icons.arrow_forward,color: Colors.black,),
          ],
        ),
      ),
    );
  }
}