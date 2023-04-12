import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_app/core/backend/movie_modal.dart';

//
//class for fetching movies from server and convert to data from json
class RepositaryMovies {
  final String applyUrl;
  RepositaryMovies({required this.applyUrl});

  /// Fetch movies based on the api url given
  Future<List<MovieModal>> getMoviesMethod() async {
    try {
      final url = applyUrl;
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      // print('status code >>> ${response.statusCode}');

      final List<MovieModal> listOfMovies = [];

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        for (var eachMovies in jsonData["results"]) {
          final movieDetails = MovieModal(
            movieName: eachMovies["original_title"] ?? "Network Error",
            posterPath: eachMovies["poster_path"] ?? "Network Error",
            overview: eachMovies["overview"] ?? "Network Error",
            releaseDate: eachMovies["release_date"] ?? "Network Error",
          );

          listOfMovies.add(movieDetails);
        }
        //  print("NUMBER OF MOVIES >>> ${listOfMoviePoster.length}");

        return listOfMovies;
      } else {
        throw Exception();
      }
    } catch (_) {
      //  print("SOMETHING WENT WRONG >> $e");
      throw Exception();
    }
  }
}
