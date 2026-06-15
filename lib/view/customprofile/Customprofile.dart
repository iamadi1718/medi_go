import 'package:flutter/material.dart';

class Customprofile extends StatelessWidget {
  const Customprofile({
    super.key,
    required this.text,
    required this.onTaps,
    this.isselected = false,
  });

  final String text;
  final VoidCallback onTaps;
  final bool isselected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaps,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 50,
          width: 370,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isselected ? Colors.black : const Color(0xffe7e7e7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isselected ? Colors.white : Colors.black,
                ),
              ),
              Icon(
                isselected
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right_rounded,
                color: isselected ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
