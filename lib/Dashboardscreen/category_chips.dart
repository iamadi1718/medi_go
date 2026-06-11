import 'package:flutter/material.dart';
import 'package:medi_go/hospitalscreen/urgent&emergency.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  String selectedCategory = "Hospitals";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _chip("Hospitals", Icons.local_hospital_outlined, selectedCategory == "Hospitals", () {
          setState(() {
            selectedCategory = "Hospitals";
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UrgentEmergencyScreen(),
            ),
          );
        }),
        _chip("Labs", Icons.science_outlined, selectedCategory == "Labs", () {
          setState(() {
            selectedCategory = "Labs";
          });
        }),
        _chip("Stores", Icons.storefront_outlined, selectedCategory == "Stores", () {
          setState(() {
            selectedCategory = "Stores";
          });
        }),
      ],
    );
  }

  Widget _chip(
    String title,
    IconData icon,
    bool selected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF0F8894) : Colors.white,
          border: Border.all(
            color: selected ? const Color(0xFF0F8894) : Colors.grey.shade300,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? Colors.white : Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
