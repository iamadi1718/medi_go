import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        value: isOn,
        activeThumbColor: Colors.white,
        activeTrackColor: Colors.teal,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
        onChanged: (value) {
          setState(() {
            isOn = value;
          });
        },
      ),
    );
  }
}
