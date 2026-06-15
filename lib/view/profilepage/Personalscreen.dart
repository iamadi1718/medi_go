import 'package:flutter/material.dart';
import 'package:medi_go/view/customdocumentscard/Customdocumentscard.dart';

class Personalscreen extends StatelessWidget {
  const Personalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 160,
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
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Color(0xffe7e7e7),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    top: 80,
                    child: Text(
                      'Personal Info',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe7e7e7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 193,
              width: 350,

              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      'assets/images/goku.jpg',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('ID: MG-78-dhr '),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Text('Status:'),
                      Text(
                        'Verified',
                        style: TextStyle(color: Colors.lightGreen),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "CURRENT ACCOUNT STATE",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 20),

            // Status Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffE8ECEF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.hourglass_empty,
                      color: Color(0xff0F8894),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Verifying",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Initial checks in progress",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, color: Color(0xff0F8894)),
                  SizedBox(width: 10),
                  Text(
                    "Standard verification takes 4-12 hours.",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A8A97),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "VERIFICATION STEPS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 35),

                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Color(0xFF0A8A97),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Phone Confirmed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white54, width: 3),
                          ),
                          child: const Text(
                            "2",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Document Upload",
                          style: TextStyle(color: Colors.white54, fontSize: 22),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white54, width: 3),
                          ),
                          child: const Text(
                            "3",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Biometric Match",
                          style: TextStyle(color: Colors.white54, fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Choose Verification Document',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Customdocumentscard(
                  image: Image.asset(
                    'assets/images/Margin.png',
                    height: 45,
                    width: 36,
                  ),
                  text: 'Aadhar',
                  second: 'Instant via OTP',
                ),
                Customdocumentscard(
                  image: Image.asset(
                    'assets/images/Background.png',
                    height: 45,
                    width: 36,
                  ),
                  text: 'PAN',
                  second: 'Visual scan',
                ),
                Customdocumentscard(
                  image: Image.asset(
                    'assets/images/Background2.png',
                    height: 45,
                    width: 36,
                  ),
                  text: 'Passport',
                  second: 'Global Standard',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
