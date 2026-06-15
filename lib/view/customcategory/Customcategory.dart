import 'package:flutter/material.dart';

class Customcategory extends StatelessWidget {
  const Customcategory({
    super.key,
    required this.text,
    required this.subtext,
    required this.image,
  });
  final String text;
  final String subtext;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      // height: 168,
      decoration: BoxDecoration(
        color: Color(0xff05818E),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            image,
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              subtext,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
