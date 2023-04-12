import 'package:flutter/material.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/frontend/constants.dart';

class MovieTrailerWidget extends StatelessWidget {
  final String imagePath;
  final double leftPadding;
  const MovieTrailerWidget({
    super.key,
    required this.imagePath,
    this.leftPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15, right: 8, left: leftPadding),
      child: Stack(
        children: [
          Container(
            color: Colors.grey.shade800,
            width: double.infinity,
            height: 180,
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          // mute icon
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: Icon(
                  Icons.volume_off_rounded,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
