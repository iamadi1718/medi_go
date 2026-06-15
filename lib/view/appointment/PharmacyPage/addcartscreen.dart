import 'package:flutter/material.dart';

class AddCartScreen extends StatefulWidget {
  final Map<String, int>? initialCart;
  const AddCartScreen({super.key, this.initialCart});

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
  // Master list of medications, matching about_store.dart
  final List<Map<String, dynamic>> allMedications = [
    {
      "id": "1",
      "name": "Dolo 650",
      "brand": "Glaxo Smithcline",
      "description": "strip of 15 Tablets",
      "price": 9.99,
      "imagePath": "assets/images/crossing.png",
      "category": "Medicines",
    },
    {
      "id": "2",
      "name": "OBH Combi",
      "brand": "Combiphar",
      "description": "75ml",
      "price": 9.99,
      "imagePath": "assets/images/cat2.png",
      "category": "Medicines",
    },
    {
      "id": "3",
      "name": "Panadol",
      "brand": "Cipla",
      "description": "20pcs",
      "price": 7.995,
      "imagePath": "assets/images/crossing.png",
      "category": "Medicines",
    },
    {
      "id": "4",
      "name": "Baby Powder",
      "brand": "Himalaya",
      "description": "200g bottle",
      "price": 120.00,
      "imagePath": "assets/images/crossing.png",
      "category": "Baby Care",
    },
    {
      "id": "5",
      "name": "Baby Oil",
      "brand": "Johnson & Johnson",
      "description": "100ml bottle",
      "price": 180.00,
      "imagePath": "assets/images/crossing.png",
      "category": "Baby Care",
    },
  ];

  late Map<String, int> cart;

  @override
  void initState() {
    super.initState();
    // If initialCart is null (e.g. opened directly from main.dart),
    // let's populate with mock items to match the user's screenshot exactly.
    if (widget.initialCart == null || widget.initialCart!.isEmpty) {
      cart = {
        "2": 1, // OBH Combi -> 1
        "3": 2, // Panadol -> 2
      };
    } else {
      cart = Map<String, int>.from(widget.initialCart!);
    }
  }

  // Helper to fetch medication by ID
  Map<String, dynamic>? getMedicationById(String id) {
    try {
      return allMedications.firstWhere((med) => med["id"] == id);
    } catch (_) {
      return null;
    }
  }

  double get subtotal {
    double total = 0.0;
    cart.forEach((medId, qty) {
      final med = getMedicationById(medId);
      if (med != null) {
        total += (med["price"] as double) * qty;
      }
    });
    return total;
  }

  double get taxes =>
      subtotal > 0 ? 1.00 : 0.0; // Flat $1.00 tax to match screenshot

  double get grandTotal {
    return subtotal + taxes;
  }

  @override
  Widget build(BuildContext context) {
    final cartKeys = cart.keys.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCustomHeader(),
                  if (cart.isEmpty)
                    _buildEmptyState()
                  else
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCartItemsList(cartKeys),
                          const SizedBox(height: 24),
                          _buildPaymentDetailSection(),
                          const SizedBox(height: 24),
                          _buildPaymentMethodSection(),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (cart.isNotEmpty) _buildBottomCheckoutBar(),
        ],
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F8894), Color(0xFF20B0C0)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, cart);
                },
              ),
              const Expanded(
                child: Text(
                  "My Cart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 48), // Spacer to balance back button
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 32, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFFE6F3F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 72,
              color: Color(0xFF0F8894),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Your cart is empty",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Looks like you haven't added any products to your cart yet.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, cart);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F8894),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              elevation: 0,
            ),
            child: const Text(
              "Go Shop Now",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList(List<String> keys) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final medId = keys[index];
        final med = getMedicationById(medId);
        final qty = cart[medId] ?? 0;

        if (med == null) return const SizedBox.shrink();

        final double itemTotalPrice = (med["price"] as double) * qty;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.01),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Circular Image Container with shadow
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      med["imagePath"] as String,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.medical_services_outlined,
                            color: Color(0xFF0F8894),
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Name, Subtitle, and Qty Selector
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      med["name"] as String,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      med["description"] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Quantity Selector: -  [qty]  +
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (qty == 1) {
                                cart.remove(medId);
                              } else {
                                cart[medId] = qty - 1;
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "$qty",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cart[medId] = qty + 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F8894),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Delete Bin and Row Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () {
                      setState(() {
                        cart.remove(medId);
                      });
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "\$${itemTotalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentDetailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Detail",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            Text(
              "\$${subtotal.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Taxes",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            Text(
              "\$${taxes.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "\$${grandTotal.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Method",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "VISA",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF1A1F71),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Change payment method action
                },
                child: Text(
                  "Change",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomCheckoutBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Total",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  "\$ ${grandTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
              width: 160,
              child: ElevatedButton(
                onPressed: _showSuccessOrderDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F8894),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessOrderDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: Color(0xFFECFDF5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Color(0xFF10B981),
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Payment Success",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Your payment has been successful, you can have a consultation session with your trusted doctor",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Pop dialog
                        Navigator.pop(context);
                        // Clear the cart
                        setState(() {
                          cart.clear();
                        });
                        // Pop screen back to store screen with empty cart
                        Navigator.pop(context, cart);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F8894),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Back to Store",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
