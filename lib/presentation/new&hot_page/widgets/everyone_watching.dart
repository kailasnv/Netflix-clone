import 'package:flutter/material.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/new&hot_page/widgets/movie_trailer_tile.dart';
import 'package:netflix_app/presentation/widgets%20common/custom_icon.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String imagePath;
  final String movieName;
  final String overview;
  final String releaseDate;
  const EveryonesWatchingWidget({
    super.key,
    required this.imagePath,
    required this.movieName,
    required this.overview,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 450,
      //color: Colors.deepPurple,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // video trailer of movie
          MovieTrailerWidget(imagePath: urlImageFirstPartLandScape + imagePath),
          Row(
            children: [
              Expanded(
                child: Text(
                  movieName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              // some buttons   icons -/ such as share , add to my list , Play

              const Spacer(),
              const CustomIconWithText(icon: Icons.share, title: 'Share'),
              kWidth,
              const CustomIconWithText(icon: Icons.add, title: 'My List'),
              kWidth,
              const CustomIconWithText(icon: Icons.play_arrow, title: 'Play'),
              kWidth,
            ],
          ),
          kHeight,
          kHeight,
          // netflix logo
          Row(
            children: [
              Image.asset(
                "lib/core/frontend/images/netflix.png",
                width: 15,
              ),
              kWidth,
              const Text('A Netflix Film', style: greyTextStyle),
            ],
          ),
          kHeight,
          kHeight,
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
    );
  }
}
