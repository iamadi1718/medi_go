import 'package:flutter/material.dart';

class Settingstile extends StatelessWidget {
  const Settingstile({
    super.key,
    this.icon,
    required this.trailing,
    required this.title,
    required this.subtitle,
    this.circlecolor,
  });

  final Icon? icon;
  final Widget trailing;
  final String title;
  final String subtitle;
  final Color? circlecolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          CircleAvatar(backgroundColor: circlecolor, radius: 20, child: icon),
          const SizedBox(width: 12),
        ] else
          const SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ],
          ),
        ),

        trailing,
      ],
    );
  }
}
