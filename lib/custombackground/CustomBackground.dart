import 'package:flutter/material.dart';

class Custombackground extends StatelessWidget {
  const Custombackground({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff005c67), Color(0xff00b8cd)],
          ),
        ),
        child: widget,
      ),
    );
  }
}
