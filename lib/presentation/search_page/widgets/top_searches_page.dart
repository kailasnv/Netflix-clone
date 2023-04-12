import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/widgets%20common/title_for_playlist.dart';

import '../../../application/search_page/bloc_search/search_bloc.dart';

class TopSearchesPage extends StatelessWidget {
  const TopSearchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleForPlaylist(title: 'Top Searches'),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.idleList != null) {
                return ListView.builder(
                  itemCount: state.idleList!.length,
                  itemBuilder: (context, index) {
                    return MovieTile(
                      imagePath: state.idleList![index].posterPath,
                      movieName: state.idleList![index].movieName,
                    );
                  },
                );
              } else {
                return kWidth;
              }
            },
          ),
        ),
      ],
    );
  }
}

/// each movie tile row

class MovieTile extends StatelessWidget {
  final String imagePath;
  final String movieName;

  const MovieTile(
      {super.key, required this.imagePath, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      width: double.infinity,
      height: 110,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                width: 170,
                // color: Colors.blue,
                child: Image.network(
                  "$urlImageFirstPart$imagePath",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //movie title
          Expanded(
            child: Text(
              movieName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //play icon button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_outline_rounded,
              size: 45,
            ),
          ),
          kWidth,
        ],
      ),
    );
  }
}
