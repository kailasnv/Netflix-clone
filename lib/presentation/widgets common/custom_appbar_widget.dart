// // A appbar widget for download and fast&and laugh pages

import 'package:flutter/material.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/widgets%20common/smile_box.dart';

class CustomAppbarWidget extends StatelessWidget {
  final String title;
  final PreferredSizeWidget? bottomWidget;
  const CustomAppbarWidget({
    super.key,
    required this.title,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      actions: [
        Row(
          children: const [
            Icon(
              Icons.cast,
            ),
            kWidth,
            SmileBlueBox(),
            kWidth,
          ],
        ),
      ],
      bottom: bottomWidget,
    );
  }
}
