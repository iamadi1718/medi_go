import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key, required this.icon, required this.text, required this.controller});
  final Icon icon;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: text,
            hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
