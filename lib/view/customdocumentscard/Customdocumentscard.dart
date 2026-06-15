import 'package:flutter/material.dart';

class Customdocumentscard extends StatelessWidget {
  const Customdocumentscard({
    super.key,
    required this.image,
    required this.text,
    required this.second,
  });
  final Image image;
  final String text;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            image,
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              second,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff4c616b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
