import 'package:flutter/material.dart';
import 'package:medi_go/view/bookappointment/bookappointment.dart';
import 'package:medi_go/view/PharmacyPage/about_store.dart';
import 'package:medi_go/view/Dashboardscreen/hospital_card.dart';

class NearbyPartnersScreen extends StatefulWidget {
  final String category; // "Hospitals", "Labs", "Stores"

  const NearbyPartnersScreen({
    super.key,
    required this.category,
  });

  @override
  State<NearbyPartnersScreen> createState() => _NearbyPartnersScreenState();
}

class _NearbyPartnersScreenState extends State<NearbyPartnersScreen> {
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  // Static list of partners categorized
  final Map<String, List<Map<String, dynamic>>> partnersData = {
    "Hospitals": [
      {
        "name": "City Hospital",
        "distance": "2.5 km",
        "badgeText": "Get 10% OFF",
        "rating": 4.0,
        "statusText": "Open: 24×7",
        "statusColor": Colors.green,
        "logoIcon": Icons.local_hospital_outlined,
        "logoBgColor": const Color(0xFFE0F2F1),
        "logoColor": const Color(0xFF0F8894),
        "buttonText": "Book\nAppointment",
        "destination": "appointment",
      },
      {
        "name": "Apolo Hospital",
        "distance": "5.1 km",
        "badgeText": "12% OFF*",
        "rating": 4.5,
        "statusText": "Open: 24×7",
        "statusColor": Colors.green,
        "logoIcon": Icons.apartment_outlined,
        "logoBgColor": const Color(0xFFE8F5E9),
        "logoColor": Colors.green,
        "buttonText": "Book\nAppointment",
        "destination": "appointment",
      },
      {
        "name": "Max Healthcare",
        "distance": "3.2 km",
        "badgeText": "Flat 100 OFF",
        "rating": 4.2,
        "statusText": "Closes: 9pm",
        "statusColor": Colors.orange,
        "logoIcon": Icons.local_hospital,
        "logoBgColor": const Color(0xFFE1F5FE),
        "logoColor": Colors.blue,
        "buttonText": "Book\nAppointment",
        "destination": "appointment",
      },
    ],
    "Labs": [
      {
        "name": "PathKind Lab",
        "distance": "2.6 km",
        "badgeText": "Flat 200 OFF*",
        "rating": 4.0,
        "statusText": "Closes: 9pm",
        "statusColor": Colors.orange,
        "logoIcon": Icons.science_outlined,
        "logoBgColor": const Color(0xFFFFF3E0),
        "logoColor": Colors.orange,
        "buttonText": "Book\nTest",
        "destination": "appointment",
      },
      {
        "name": "Dr Lal PathLabs",
        "distance": "3.0 km",
        "badgeText": "15% OFF*",
        "rating": 4.4,
        "statusText": "Closes: 8pm",
        "statusColor": Colors.orange,
        "logoIcon": Icons.biotech_outlined,
        "logoBgColor": const Color(0xFFFFEBEE),
        "logoColor": Colors.red,
        "buttonText": "Book\nTest",
        "destination": "appointment",
      },
      {
        "name": "SRL Diagnostics",
        "distance": "1.8 km",
        "badgeText": "Get 10% OFF",
        "rating": 4.1,
        "statusText": "Closes: 7pm",
        "statusColor": Colors.orange,
        "logoIcon": Icons.science,
        "logoBgColor": const Color(0xFFF3E5F5),
        "logoColor": Colors.purple,
        "buttonText": "Book\nTest",
        "destination": "appointment",
      },
    ],
    "Stores": [
      {
        "name": "Vansh Pharmacy",
        "distance": "2.5 km",
        "badgeText": "10% OFF*",
        "rating": 4.5,
        "statusText": "Open: 24×7",
        "statusColor": Colors.green,
        "logoIcon": Icons.storefront_outlined,
        "logoBgColor": const Color(0xFFE8F5E9),
        "logoColor": Colors.green,
        "buttonText": "View\nStore",
        "destination": "store",
      },
      {
        "name": "Apollo Pharmacy",
        "distance": "1.2 km",
        "badgeText": "12% OFF*",
        "rating": 4.3,
        "statusText": "Open: 24×7",
        "statusColor": Colors.green,
        "logoIcon": Icons.local_pharmacy_outlined,
        "logoBgColor": const Color(0xFFEBF6F8),
        "logoColor": const Color(0xFF0F8894),
        "buttonText": "View\nStore",
        "destination": "store",
      },
      {
        "name": "MedPlus Pharmacy",
        "distance": "3.5 km",
        "badgeText": "5% OFF*",
        "rating": 4.1,
        "statusText": "Closes: 10pm",
        "statusColor": Colors.orange,
        "logoIcon": Icons.store_mall_directory_outlined,
        "logoBgColor": const Color(0xFFFFF3E0),
        "logoColor": Colors.orange,
        "buttonText": "View\nStore",
        "destination": "store",
      },
    ],
  };

  List<Map<String, dynamic>> get filteredPartners {
    final list = partnersData[widget.category] ?? [];
    if (searchQuery.isEmpty) return list;
    return list
        .where((partner) =>
            partner["name"].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  String get screenTitle {
    switch (widget.category) {
      case "Hospitals":
        return "Nearby Hospitals";
      case "Labs":
        return "Nearby Labs";
      case "Stores":
        return "Nearby Medical Stores";
      default:
        return "Nearby Partners";
    }
  }

  String get searchHint {
    switch (widget.category) {
      case "Hospitals":
        return "Search Hospitals";
      case "Labs":
        return "Search Labs";
      case "Stores":
        return "Search Stores";
      default:
        return "Search";
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = filteredPartners;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Teal Header
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
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
                    Expanded(
                      child: Text(
                        screenTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Search Bar
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
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    searchQuery = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: searchHint,
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

          // List of Partners
          Expanded(
            child: list.isEmpty
                ? Center(
                    child: Text(
                      "No matches found.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final partner = list[index];
                      return HospitalCard(
                        name: partner["name"],
                        distance: partner["distance"],
                        badgeText: partner["badgeText"],
                        rating: partner["rating"],
                        statusText: partner["statusText"],
                        statusColor: partner["statusColor"],
                        logoIcon: partner["logoIcon"],
                        logoBgColor: partner["logoBgColor"],
                        logoColor: partner["logoColor"],
                        buttonText: partner["buttonText"],
                        onBook: () {
                          if (partner["destination"] == "store") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutStorePage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookAppointmentscreen(),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
