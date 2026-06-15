import 'package:flutter/material.dart';

class Customsettings extends StatelessWidget {
  const Customsettings({super.key, required this.icon, required this.first, required this.widget,  });
  final Icon icon;
  final String first;
 
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            SizedBox(width: 10,),
            Text(first,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          ],
        ),
        Container(
          
          width: 370,
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:Column(
            children: [
              widget,
            ],
          )
          ),
      ],
    );
  }
}