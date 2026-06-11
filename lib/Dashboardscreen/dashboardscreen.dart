import 'package:flutter/material.dart';
import 'package:medi_go/Dashboardscreen/welcome_card.dart';
import 'package:medi_go/Dashboardscreen/qr_section.dart';
import 'package:medi_go/scan_qrscreen/scanscreen.dart';
import 'package:medi_go/Dashboardscreen/category_chips.dart';
import 'package:medi_go/Dashboardscreen/nearby_partners_title.dart';
import 'package:medi_go/Dashboardscreen/hospital_card.dart';
import 'package:medi_go/hospitalscreen/urgent&emergency.dart';

class Dashboardscreen extends StatelessWidget {
  const Dashboardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top overlapping header area
            SizedBox(
              height: 315,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Teal Header Background
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F8894),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    // child: SafeArea(
                    //   bottom: false,
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         // MediGo Logo
                    //         Container(
                    //           width: 32,
                    //           height: 32,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.white,
                    //             shape: BoxShape.circle,
                    //           ),
                    //           child: const Icon(
                    //             Icons.add,
                    //             color: Color(0xFF0F8894),
                    //             size: 22,
                    //           ),
                    //         ),
                    //         const SizedBox(width: 8),
                    //         const Text(
                    //         //   "MediGo",
                    //         //   style: TextStyle(
                    //         //     color: Colors.white,
                    //         //     fontSize: 22,
                    //         //     fontWeight: FontWeight.bold,
                    //         //   ),
                    //         // ),
                    //         const Spacer(),
                    //         // Action Icons
                    //         const Icon(Icons.search, color: Colors.white, size: 24),
                    //         const SizedBox(width: 16),
                    //         const Icon(Icons.medical_services_outlined, color: Colors.white, size: 24),
                    //         const SizedBox(width: 16),
                    //         const Icon(Icons.notifications_none, color: Colors.white, size: 24),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),

                  // Overlapping Welcome + QR Card
                  Positioned(
                    top: 85,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const WelcomeCard(),
                            const SizedBox(height: 14),
                            QrSection(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Scanscreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Category Chips
            const CategoryChips(),

            const SizedBox(height: 24),

            // Nearby Partners Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: NearbyPartnersTitle(),
            ),

            const SizedBox(height: 12),

            // List of Nearby Partners
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  HospitalCard(
                    name: "City Hospital",
                    distance: "2.5 km",
                    badgeText: "Get 10% OFF",
                    rating: 4.0,
                    statusText: "Open: 24×7",
                    statusColor: Colors.green,
                    logoIcon: Icons.local_hospital_outlined,
                    logoBgColor: const Color(0xFFE0F2F1),
                    logoColor: const Color(0xFF0F8894),
                    onBook: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UrgentEmergencyScreen(),
                        ),
                      );
                    },
                  ),
                  HospitalCard(
                    name: "PathKind Lab",
                    distance: "2.6 km",
                    badgeText: "Flat 200 OFF*",
                    rating: 4.0,
                    statusText: "Closes: 9pm",
                    statusColor: Colors.grey.shade600,
                    logoIcon: Icons.science_outlined,
                    logoBgColor: const Color(0xFFFFF3E0),
                    logoColor: Colors.orange,
                    onBook: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UrgentEmergencyScreen(),
                        ),
                      );
                    },
                  ),
                  HospitalCard(
                    name: "Apolo Hospital",
                    distance: "5.1 km",
                    badgeText: "12% OFF*",
                    rating: 4.0,
                    statusText: "Open: 24×7",
                    statusColor: Colors.green,
                    logoIcon: Icons.apartment_outlined,
                    logoBgColor: const Color(0xFFE8F5E9),
                    logoColor: Colors.green,
                    onBook: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UrgentEmergencyScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16), // Bottom breathing room
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
