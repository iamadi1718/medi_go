import 'package:flutter/material.dart';
import 'package:medi_go/view/bookappointment/bookappointment.dart';

class UrgentEmergencyScreen extends StatelessWidget {
  const UrgentEmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. Teal Header Box with rounded bottom corners
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF0F8894),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Header Row with back button and title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            "Urgent & Emergency\nCare",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // White Emergency Pill Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      "Emergency",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Call 108 Option
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_in_talk, color: Colors.white, size: 24),
                      SizedBox(width: 8),
                      Text(
                        "Call 108",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 2. Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade300, width: 1.2),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Hospitals",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),

          // 3. Hospital Cards List (Scrollable)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _emergencyHospitalCard(
                  context: context,
                  name: "City Hospital",
                  distance: "2.5 km",
                  statusText: "24×7 Emergency",
                  logoBgColor: const Color(0xFFE0F2F1),
                  logoColor: const Color(0xFF0F8894),
                  onWaitTimes: () {
                    debugPrint("City Hospital wait times clicked");
                  },
                  onDirections: () {
                    debugPrint("City Hospital directions clicked");
                  },
                ),
                _emergencyHospitalCard(
                  context: context,
                  name: "City Hospital",
                  distance: "2.5 km",
                  statusText: "24×7 Emergency",
                  logoBgColor: const Color(0xFFE0F2F1),
                  logoColor: const Color(0xFF0F8894),
                  onWaitTimes: () {
                    debugPrint("City Hospital wait times clicked");
                  },
                  onDirections: () {
                    debugPrint("City Hospital directions clicked");
                  },
                ),
                _emergencyHospitalCard(
                  context: context,
                  name: "City Hospital",
                  distance: "2.5 km",
                  statusText: "24×7 Emergency",
                  logoBgColor: const Color(0xFFE0F2F1),
                  logoColor: const Color(0xFF0F8894),
                  onWaitTimes: () {
                    debugPrint("City Hospital wait times clicked");
                  },
                  onDirections: () {
                    debugPrint("City Hospital directions clicked");
                  },
                ),
                _emergencyHospitalCard(
                  name: "City Hospital",
                  context: context,
                  distance: "2.5 km",
                  statusText: "24×7 Emergency",
                  logoBgColor: const Color(0xFFE0F2F1),
                  logoColor: const Color(0xFF0F8894),
                  onWaitTimes: () {
                    debugPrint("City Hospital wait times clicked");
                  },
                  onDirections: () {
                    debugPrint("City Hospital directions clicked");
                  },
                ),

                _emergencyHospitalCard(
                  name: "City Hospital",
                  distance: "2.5 km",
                  context: context,
                  statusText: "24×7 Emergency",
                  logoBgColor: const Color(0xFFE0F2F1),
                  logoColor: const Color(0xFF0F8894),
                  onWaitTimes: () {
                    debugPrint("City Hospital wait times clicked");
                  },
                  onDirections: () {
                    debugPrint("City Hospital directions clicked");
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emergencyHospitalCard({
    required BuildContext context,
    required String name,
    required String distance,
    required String statusText,
    required Color logoBgColor,
    required Color logoColor,
    required VoidCallback onWaitTimes,
    required VoidCallback onDirections,
  }) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const BookAppointmentscreen(),
      //     ),
      //   );
      // },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row (Logo, Info, Status)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: logoBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.local_hospital_outlined,
                    color: logoColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 10),

                // Info (Name & Location)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Status (Open Now / Emergency)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Open Now:",
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      statusText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Bottom Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Wait Times (Outline Button)
                OutlinedButton(
                  onPressed: onWaitTimes,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300, width: 1.2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Wait Times",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Directions (Solid Teal Button)
                ElevatedButton(
                  onPressed: onDirections,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F8894),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Directions",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
