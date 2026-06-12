import 'package:flutter/material.dart';
import 'package:medi_go/bookappointment/bookappointment.dart';

class HospitalCard extends StatelessWidget {
  final String name;
  final String distance;
  final String badgeText;
  final double rating;
  final String statusText;
  final Color statusColor;
  final IconData logoIcon;
  final Color logoBgColor;
  final Color logoColor;
  final VoidCallback onBook;

  const HospitalCard({
    super.key,
    required this.name,
    required this.distance,
    required this.badgeText,
    required this.rating,
    required this.statusText,
    required this.statusColor,
    required this.logoIcon,
    required this.logoBgColor,
    required this.logoColor,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Hospital/Lab Logo Container
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: logoBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(logoIcon, color: logoColor, size: 28),
          ),
          const SizedBox(width: 12),

          // Middle: Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name and Offer Badge Row
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF0F4C5C,
                        ), // Elegant dark teal/blue
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        badgeText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Location/Distance
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
                const SizedBox(height: 4),

                // Ratings Star Row
                Row(
                  children: [
                    const Text(
                      "Ratings: ",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    _buildStars(rating),
                  ],
                ),
                const SizedBox(height: 4),

                // Availability Status
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Right: Book Appointment Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookAppointmentscreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F8894),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              "Book\nAppointment",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalf = (rating - fullStars) >= 0.5;

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 13));
      } else if (i == fullStars && hasHalf) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 13));
      } else {
        stars.add(Icon(Icons.star, color: Colors.grey.shade300, size: 13));
      }
    }
    return Row(children: stars);
  }
}
