import 'package:flutter/material.dart';
import 'package:medi_go/view/appointment/PharmacyPage/addcartscreen.dart';

class Medication {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imagePath;
  final String category;

  Medication({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
  });
}

class AboutStorePage extends StatefulWidget {
  const AboutStorePage({super.key});

  @override
  State<AboutStorePage> createState() => _AboutStorePageState();
}

class _AboutStorePageState extends State<AboutStorePage> {
  String selectedCategory = "All";
  String searchQuery = "";
  Map<String, int> cart = {};

  final List<Medication> allMedications = [
    Medication(
      id: "1",
      name: "Dolo 650",
      brand: "Glaxo Smithcline",
      description: "strip of 15 Tablets",
      price: 45.00,
      imagePath: "assets/images/splash.png",
      category: "Medicines",
    ),
    Medication(
      id: "2",
      name: "OBH Combi",
      brand: "Combiphar",
      description: "75ml syrup for cough",
      price: 65.00,
      imagePath: "assets/images/cat2.png",
      category: "Medicines",
    ),
    Medication(
      id: "3",
      name: "Paracetamol",
      brand: "Cipla",
      description: "strip of 10 Tablets",
      price: 25.00,
      imagePath: "assets/images/splash.png",
      category: "Medicines",
    ),
    Medication(
      id: "4",
      name: "Baby Powder",
      brand: "Himalaya",
      description: "200g bottle",
      price: 120.00,
      imagePath: "assets/images/splash.png",
      category: "Baby Care",
    ),
    Medication(
      id: "5",
      name: "Baby Oil",
      brand: "Johnson & Johnson",
      description: "100ml bottle",
      price: 180.00,
      imagePath: "assets/images/splash.png",
      category: "Baby Care",
    ),
    Medication(
      id: "6",
      name: "Multivitamins",
      brand: "HealthKart",
      description: "bottle of 60 capsules",
      price: 250.00,
      imagePath: "assets/images/splash.png",
      category: "Suppliments",
    ),
    Medication(
      id: "7",
      name: "Vitamin C",
      brand: "Limcee",
      description: "strip of 15 chewable tablets",
      price: 95.00,
      imagePath: "assets/images/splash.png",
      category: "Suppliments",
    ),
    Medication(
      id: "8",
      name: "Band-Aid",
      brand: "Johnson & Johnson",
      description: "box of 20 strips",
      price: 30.00,
      imagePath: "assets/images/splash.png",
      category: "First Aid",
    ),
    Medication(
      id: "9",
      name: "Antiseptic Liquid",
      brand: "Dettol",
      description: "100ml bottle",
      price: 50.00,
      imagePath: "assets/images/splash.png",
      category: "First Aid",
    ),
  ];

  List<Medication> get filteredMedications {
    return allMedications.where((med) {
      final matchesCategory =
          selectedCategory == "All" || med.category == selectedCategory;
      final matchesSearch =
          med.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          med.brand.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  int get totalCartItems {
    return cart.values.fold(0, (sum, val) => sum + val);
  }

  double get totalCartPrice {
    double total = 0.0;
    cart.forEach((medId, qty) {
      final med = allMedications.firstWhere((m) => m.id == medId);
      total += med.price * qty;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderAndProfileStack(),
                  const SizedBox(height: 12),
                  _buildSearchBar(),
                  _buildPrescriptionBanner(),
                  _buildCategoryChips(),
                  _buildMedicinesList(),
                  const SizedBox(height: 100), // Spacing for floating cart bar
                ],
              ),
            ),
          ),
          if (totalCartItems > 0)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: _buildFloatingCartBar(),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderAndProfileStack() {
    return SizedBox(
      height: 240,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Teal Header Background
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF0F8894),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'About Store',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final updatedCart =
                            await Navigator.push<Map<String, int>>(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        AddCartScreen(initialCart: cart),
                              ),
                            );
                        if (updatedCart != null) {
                          setState(() {
                            cart = Map<String, int>.from(updatedCart);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // White Profile Card container
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            height: 130,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          // Circle Avatar centered, overlapping the top edge of the card
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/splash.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Profile Card Content (Title & location/status)
          Positioned(
            top: 145,
            left: 32,
            right: 32,
            child: Column(
              children: [
                const Text(
                  "Vansh Pharmacy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Color(0xFF0F8894),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "2.5 km",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Open 24×7",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF10B981),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    searchQuery = val;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Search Medication",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F8894),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order quickly with\nPrescription",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Upload prescription action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0F8894),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Upload Prescription",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            height: 90,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/images/cat2.png', fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = [
      "All",
      "Medicines",
      "Baby Care",
      "Suppliments",
      "First Aid",
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children:
            categories.map((category) {
              final isSelected = selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? const Color(0xFF0F8894) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:
                            isSelected
                                ? const Color(0xFF0F8894)
                                : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey.shade800,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildMedicinesList() {
    final list = filteredMedications;
    if (list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            "No medications found.",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        final med = list[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FAFC),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(med.imagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      med.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${med.brand}, ${med.description}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Rs. ${med.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F8894),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildCartButton(med),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartButton(Medication med) {
    final qty = cart[med.id] ?? 0;
    if (qty == 0) {
      return SizedBox(
        height: 34,
        width: 76,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              cart[med.id] = 1;
            });
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade300, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            "+ Add",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 34,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF0F8894), width: 1.5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (qty == 1) {
                    cart.remove(med.id);
                  } else {
                    cart[med.id] = qty - 1;
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.remove, size: 14, color: Color(0xFF0F8894)),
              ),
            ),
            Text(
              "$qty",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color(0xFF0F8894),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  cart[med.id] = qty + 1;
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.add, size: 14, color: Color(0xFF0F8894)),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildFloatingCartBar() {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F8894),
        borderRadius: BorderRadius.circular(27),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$totalCartItems Items | Rs. ${totalCartPrice.toStringAsFixed(2)}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final updatedCart = await Navigator.push<Map<String, int>>(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCartScreen(initialCart: cart),
                ),
              );
              if (updatedCart != null) {
                setState(() {
                  cart = Map<String, int>.from(updatedCart);
                });
              }
            },
            child: const Row(
              children: [
                Text(
                  "View Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
