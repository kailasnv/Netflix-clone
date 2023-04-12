import 'package:flutter/material.dart';

class SmileBlueBox extends StatelessWidget {
  const SmileBlueBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 25,
        width: 25,
        padding: const EdgeInsets.all(3),
        color: Colors.deepPurple,
        child: Image.asset(
          'lib/core/frontend/images/smile.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
