import 'dart:math';
import 'package:flutter/material.dart';

class MoviewPosterTile extends StatelessWidget {
  final EdgeInsets padding;
  final int angle;
  final double height;
  final double width;
  final String imagePath;

  const MoviewPosterTile({
    super.key,
    required this.padding,
    this.angle = 360,
    this.height = 175,
    this.width = 105,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Transform.rotate(
        angle: pi / angle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: height,
            width: width,
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
