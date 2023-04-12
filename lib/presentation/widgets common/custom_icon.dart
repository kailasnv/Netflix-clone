import 'package:flutter/material.dart';

class CustomIconWithText extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconTextColor;

  const CustomIconWithText({
    super.key,
    required this.icon,
    required this.title,
    this.iconTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Icon(
            icon,
            size: 27,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: iconTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
