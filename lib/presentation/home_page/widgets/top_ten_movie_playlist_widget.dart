import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/presentation/widgets%20common/title_for_playlist.dart';

class TopTenMoviePlayListWidget extends StatelessWidget {
  final String playlistName;
  final List<MovieModal> topTvShowsList;
  const TopTenMoviePlayListWidget({
    super.key,
    required this.playlistName,
    required this.topTvShowsList,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 210,
      // color: Colors.deepPurple[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleForPlaylist(title: playlistName),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                // intividual tiles for movies
                return Stack(
                  children: [
                    // 1st stack element = movie  image
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(
                                "$urlImageFirstPart${topTvShowsList[index].posterPath}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 2nd stack element  -number
                    Positioned(
                      bottom: -31,
                      left: -13,
                      child: BorderedText(
                        strokeWidth: 5,
                        strokeColor: Colors.white,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 145,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
