import 'package:flutter/material.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/widgets%20common/custom_icon.dart';

import 'movie_trailer_tile.dart';

class ComingSoonWidget extends StatelessWidget {
  final String movieImagePath;
  final String movieName;
  final String overview;
  final String releaseMonth;
  final String releaseDay;

  const ComingSoonWidget({
    super.key,
    required this.movieImagePath,
    required this.movieName,
    required this.overview,
    required this.releaseMonth,
    required this.releaseDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  this is the parent container
      padding: const EdgeInsets.only(right: 8, top: 15),
      width: double.infinity,
      height: 450,
      child: Row(
        // row has 2 sections
        children: [
          // date elemenet  -/ column 1
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  releaseMonth,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  releaseDay,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                    fontSize: 25,
                  ),
                ),
                //const SizedBox(width: 40),
              ],
            ),
          ),
          // movie details  -/ column 2
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // trailer of movie
                //   but - as for now only showing image of trailer no video available from api
                MovieTrailerWidget(
                  imagePath: urlImageFirstPartLandScape + movieImagePath,
                ),
                // deetails of movie -/ such has release date descripton etc.
                Row(
                  children: [
                    // movie name Heading
                    Expanded(
                      child: Text(
                        movieName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const CustomIconWithText(
                        iconTextColor: Colors.grey,
                        icon: Icons.notifications_none,
                        title: 'Remember me'),
                    kWidth,
                    const CustomIconWithText(
                        iconTextColor: Colors.grey,
                        icon: Icons.info_outline,
                        title: 'info'),
                    kWidth,
                    kWidth,
                  ],
                ),
                kHeight,
                // relaease date
                Text('Coming On  $releaseMonth  $releaseDay',
                    style: greyTextStyle),
                kHeight,
                kHeight,
                // Name
                Text(
                  movieName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                //  description
                Expanded(
                  child: Text(
                    overview,
                    style: const TextStyle(
                      color: Colors.grey,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
