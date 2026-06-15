import 'package:flutter/material.dart';
import 'package:medi_go/view/homepage/Homepage.dart';

class AppointConfirmScreen extends StatefulWidget {
  final String hospitalName;
  final String doctorName;
  final String appointmentDate;
  final String appointmentSlot;
  final String speciality;
  final String reason;

  const AppointConfirmScreen({
    super.key,
    this.hospitalName = "Apolo Hospital",
    this.doctorName = "Dr. Anil Kumar",
    this.appointmentDate = "Wednesday, 23 June 2026",
    this.appointmentSlot = "10:15 AM",
    this.speciality = "General",
    this.reason = "Regular Checkup",
  });

  @override
  State<AppointConfirmScreen> createState() => _AppointConfirmScreenState();
}

class _AppointConfirmScreenState extends State<AppointConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          // 1. Teal Header
          Container(
            height: 110,
            decoration: const BoxDecoration(
              color: Color(0xFF0F8894),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 48),
                      child: Text(
                        "Appointment Confirmation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  // Success Icon & Message
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.1),
                          blurRadius: 12,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Color(0xFF2E7D32),
                      size: 44,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Appointment Confirmed!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Your visit has been successfully booked.",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 28),

                  // Ticket-style Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Column(
                      children: [
                        // Hospital Title Info inside Card
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE0F2F1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.apartment_outlined,
                                  color: Color(0xFF0F8894),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.hospitalName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "2.5 km • Open 24×7",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Dividers with card side cuts
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: DashedDivider(
                                height: 1,
                                color: Colors.black12,
                              ),
                            ),
                            Container(
                              height: 16,
                              width: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Appointment Details Info
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              _buildDetailRow(
                                "DOCTOR",
                                widget.doctorName,
                                Icons.person_outline_rounded,
                              ),
                              const SizedBox(height: 8),
                              _buildDetailRow(
                                "SPECIALITY",
                                widget.speciality,
                                Icons.medical_services_outlined,
                              ),
                              const SizedBox(height: 8),
                              _buildDetailRow(
                                "DATE & TIME",
                                "${widget.appointmentDate} at ${widget.appointmentSlot}",
                                Icons.access_time_rounded,
                              ),
                              const SizedBox(height: 8),
                              _buildDetailRow(
                                "REASON",
                                widget.reason,
                                Icons.chat_bubble_outline_rounded,
                              ),
                            ],
                          ),
                        ),

                        // Ticket stub dashed divider
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: DashedDivider(
                                height: 1,
                                color: Colors.black12,
                              ),
                            ),
                            Container(
                              height: 16,
                              width: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Barcode & Ticket Code Stub
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 20.0,
                          ),
                          child: Column(
                            children: [
                              // Mock Barcode
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(45, (index) {
                                  // Random-looking barcode thickness
                                  final double width =
                                      (index % 3 == 0)
                                          ? 3.0
                                          : (index % 5 == 0)
                                          ? 1.0
                                          : 2.0;
                                  final bool showBar = index % 7 != 0;
                                  return Container(
                                    width: width,
                                    height: 40,
                                    color:
                                        showBar
                                            ? Colors.black87
                                            : Colors.transparent,
                                  );
                                }),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "AP-2026-0623-4491",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Back to Home Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Homepage()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F8894),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        "Back to Home",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF0F8894)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dashed Divider Class
class DashedDivider extends StatelessWidget {
  final double height;
  final Color color;

  const DashedDivider({
    super.key,
    this.height = 1,
    this.color = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
