import 'package:flutter/material.dart';

class NearbyPartnersTitle extends StatelessWidget {
  const NearbyPartnersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Nearby Partners",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
