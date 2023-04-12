import 'package:flutter/material.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/presentation/widgets%20common/title_for_playlist.dart';

class MoviePlayListWidget extends StatelessWidget {
  final String playlistName;
  final List<MovieModal> imageListOfMovies;
  const MoviePlayListWidget({
    super.key,
    required this.playlistName,
    required this.imageListOfMovies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 210,
      //color: Colors.deepPurple[400],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleForPlaylist(title: playlistName),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageListOfMovies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          "$urlImageFirstPart${imageListOfMovies[index].posterPath}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
