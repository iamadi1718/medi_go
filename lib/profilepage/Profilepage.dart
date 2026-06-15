import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 180,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Teal Header Background
            Container(
              height: 160,
              decoration: const BoxDecoration(
                color: Color(0xFF0F8894),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 80,
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xffe7e7e7),
              ),
            ),
            Positioned(
              left: 70,
              top: 80,
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffe7e7e7),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 193,
                width: 370,
                padding: EdgeInsets.symmetric(vertical: 32,horizontal: 91),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Image.asset(''),
                    Text('John Doe'),
                    Row(
                      children: [
                        Text('ID: MG-78-dhr |'),
                        Text('Status'),
                      ],
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
