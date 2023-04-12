import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  final double height;
  final List<Color> colors;

  // ignore: prefer_typing_uninitialized_variables
  final child;
  const GradientBox({
    super.key,
    this.height = 90,
    required this.colors,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}
