import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_app/core/backend/movie_modal.dart';

//class for fetching tv shows from server and convert to data from json

class RepositaryTv {
  final String applyUrl;
  RepositaryTv({required this.applyUrl});

  /// Fetch movies based on the api url given
  Future<List<MovieModal>> getTvShowsMethod() async {
    try {
      final url = applyUrl;
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      //  print('status code >>> ${response.statusCode}');

      final List<MovieModal> listOfTvShows = [];

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        for (var eachTvShows in jsonData["results"]) {
          final tvShowDetails = MovieModal(
            movieName: eachTvShows["original_name"] ?? "Network Error",
            posterPath: eachTvShows["poster_path"] ?? "Network Error",
            overview: eachTvShows["overview"] ?? "Network Error",
            releaseDate: eachTvShows["first_air_date"] ?? "Network Error",
          );

          listOfTvShows.add(tvShowDetails);
        }
        //  print("NUMBER OF MOVIES >>> ${listOfMoviePoster.length}");

        return listOfTvShows;
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }
}
