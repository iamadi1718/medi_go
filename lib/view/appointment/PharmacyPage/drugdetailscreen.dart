import 'package:flutter/material.dart';
import 'package:medi_go/PharmacyPage/addcartscreen.dart';

class DrugDetailScreen extends StatefulWidget {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imagePath;
  final Map<String, int> initialCart;

  const DrugDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.initialCart,
  });

  @override
  State<DrugDetailScreen> createState() => _DrugDetailScreenState();
}

class _DrugDetailScreenState extends State<DrugDetailScreen> {
  late Map<String, int> cart;
  late int quantity;
  bool isFavourite = false;
  bool isDescriptionExpanded = false;

  @override
  void initState() {
    super.initState();
    cart = Map<String, int>.from(widget.initialCart);
    // Initialize quantity to the value in cart, or default to 1 as shown in the mockup
    quantity = cart[widget.id] ?? 1;
  }

  void _updateCart() {
    setState(() {
      cart[widget.id] = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double totalPrice = widget.price * quantity;
    
    // Detailed medical description matching the selected drug
    final String fullDescription = widget.name == "OBH Combi"
        ? "OBH COMBI is a cough medicine containing Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, nasal congestion, and sneezing. It works as an antitussive, antihistamine, and decongestant to soothe throat irritation and clear airways."
        : "${widget.name} (${widget.brand}) is formulated for fast and effective relief of symptoms associated with fever, body aches, and pain. It contains active ingredients clinically proven to reduce temperature and alleviate minor to moderate discomfort, strip of ${widget.description}. Always read the label and follow the dosage instructions.";

    final String displayDescription = isDescriptionExpanded
        ? fullDescription
        : (fullDescription.length > 180 ? "${fullDescription.substring(0, 180)}... " : fullDescription);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Header
          _buildHeader(),
          
          // Main Body content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Favorite Heart Icon
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: isFavourite ? Colors.red : Colors.grey.shade400,
                          size: 28,
                        ),
                      ),
                    ),
                    
                    // Circular Image Container
                    Center(
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.medical_services_outlined, size: 80, color: Color(0xFF0F8894)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    
                    // Drug Title & Subtitle
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // Rating Stars & Score
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFF0F8894), size: 18),
                        const Icon(Icons.star, color: Color(0xFF0F8894), size: 18),
                        const Icon(Icons.star, color: Color(0xFF0F8894), size: 18),
                        const Icon(Icons.star, color: Color(0xFF0F8894), size: 18),
                        Icon(Icons.star_border, color: Colors.grey.shade300, size: 18),
                        const SizedBox(width: 6),
                        const Text(
                          "4.0",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F8894),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    
                    // Quantity Adjustment and Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Quantity Selector: -  [qty]  +
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                    _updateCart();
                                  });
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey.shade400,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "$quantity",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                  _updateCart();
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F8894),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Price
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    
                    // Description Section
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(text: displayDescription),
                          if (!isDescriptionExpanded && fullDescription.length > 180)
                            WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDescriptionExpanded = true;
                                  });
                                },
                                child: const Text(
                                  "Read more",
                                  style: TextStyle(
                                    color: Color(0xFF0F8894),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          
          // Bottom Navigation / Add-To-Cart / Buy Now Bar
          _buildBottomActionBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 150,
      width: double.infinity,
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
                  "Drug Detail",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () async {
                  final updatedCart = await Navigator.push<Map<String, int>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCartScreen(initialCart: cart),
                    ),
                  );
                  if (updatedCart != null) {
                    setState(() {
                      cart = Map<String, int>.from(updatedCart);
                      quantity = cart[widget.id] ?? 1;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
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
          children: [
            // Circular Add to Cart Button
            GestureDetector(
              onTap: () {
                setState(() {
                  cart[widget.id] = quantity;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${widget.name} added to cart!"),
                    backgroundColor: const Color(0xFF10B981),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBF6F8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF0F8894),
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Buy Now button
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      cart[widget.id] = quantity;
                    });
                    final updatedCart = await Navigator.push<Map<String, int>>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCartScreen(initialCart: cart),
                      ),
                    );
                    if (updatedCart != null) {
                      setState(() {
                        cart = Map<String, int>.from(updatedCart);
                        quantity = cart[widget.id] ?? 1;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F8894),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
