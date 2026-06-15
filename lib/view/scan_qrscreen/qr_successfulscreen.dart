import 'package:flutter/material.dart';

import 'package:medi_go/view/homepage/Homepage.dart';

class QrSuccessfulscreen extends StatelessWidget {
  const QrSuccessfulscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5), // Mockup background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top overlapping area
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Teal Background Header
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F8894),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),

                // Success Message Card
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Checked Rounded Teal Container
                        Container(
                          width: 68,
                          height: 68,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0F8894),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Success!",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F8894),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Your visit has been successfully logged at the clinic.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Clinic & Visit Details Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Clinic Info Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.badge_outlined,
                            color: Color(0xFF0F8894),
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Partner Clinic",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "MediGo Clinic - downtown branch",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F8894),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Grid of Details (2x2 structure)
                    Row(
                      children: [
                        Expanded(
                          child: _detailBox(
                            title: "Date & Time",
                            content: "Oct 26, 2023,\n10:30 AM",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _detailBox(
                            title: "Visit ID",
                            content: "\nMG-V-12345678",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _detailBox(
                            title: "Service Type",
                            content: "\nGeneral OPD",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _detailBox(
                            title: "Estimated Benefit",
                            content: "\nYou saved ~₹250!",
                            isHighlight: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Centered Mini Receipt / Barcode box
                    Center(
                      child: Container(
                        width: 110,
                        height: 120,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Mock receipt text lines
                            Column(
                              children: List.generate(4, (index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 6),
                                  height: 4,
                                  width:
                                      index == 0
                                          ? 70
                                          : (index == 1
                                              ? 55
                                              : (index == 2 ? 80 : 40)),
                                  color: Colors.grey.shade300,
                                );
                              }),
                            ),
                            // Barcode / QR miniature
                            const Icon(
                              Icons.qr_code,
                              color: Colors.black87,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Back to Home Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F8894),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                "Back to Home",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _detailBox({
    required String title,
    required String content,
    bool isHighlight = false,
  }) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isHighlight ? const Color(0xFFE0F2F1) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHighlight ? const Color(0xFFB2DFDB) : Colors.grey.shade200,
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color:
                  isHighlight ? const Color(0xFF0F8894) : Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isHighlight ? const Color(0xFF0F8894) : Colors.black87,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
