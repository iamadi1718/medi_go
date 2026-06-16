import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  const CategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _chip("Hospitals", Icons.local_hospital_outlined, selectedCategory == "Hospitals", () {
          debugPrint("CategoryChips: Hospitals tapped");
          onCategoryChanged("Hospitals");
        }),
        _chip("Labs", Icons.science_outlined, selectedCategory == "Labs", () {
          debugPrint("CategoryChips: Labs tapped");
          onCategoryChanged("Labs");
        }),
        _chip("Stores", Icons.storefront_outlined, selectedCategory == "Stores", () {
          debugPrint("CategoryChips: Stores tapped");
          onCategoryChanged("Stores");
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
