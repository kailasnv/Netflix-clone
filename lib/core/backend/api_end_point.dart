import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

// Api for movies from T M D B  server
class ApiEndPoint {
  // trending movies
  static const urlTrendingMovies =
      '$baseApiUrltmdb/trending/movie/day?api_key=$apiKey';

  // Get Latest Movies
  static const urlLatestMovies =
      "$baseApiUrltmdb/movie/latest?api_key=$apiKey&language=en-US";

//GET/movie/now_playing
  static const urlNowPlaying =
      "$baseApiUrltmdb/movie/now_playing?api_key=$apiKey&language=en-US&page=1";

//GET/movie/now_playing
  static const urlDiscoverMovies =
      "$baseApiUrltmdb/discover/movie?api_key=$apiKey&language=en-US&page=1";

// GET /movie/popular
  static const urlPopularMovies =
      "$baseApiUrltmdb/movie/popular?api_key=$apiKey&language=en-US&page=1";

  // GET /movie/upcoming
  static const urlUpcomingMovies =
      "$baseApiUrltmdb/movie/upcoming?api_key=$apiKey&language=en-US&page=1";

  // T  V

//GET /tv/popular
  static const urlTvPopular =
      "$baseApiUrltmdb/tv/popular?api_key=$apiKey&language=en-US&page=1";

//GET /tv/top_rated
  static const urlTopTenTv =
      "$baseApiUrltmdb/tv/top_rated?api_key=$apiKey&language=en-US&page=1";

  // S E A R C H   APIs

  //GET /movie/top_rated  ( can be used in search page's initial movies )
  static const urlTopRatedMovies =
      "$baseApiUrltmdb/movie/top_rated?api_key=$apiKey&language=en-US&page=1";
  // when search applied
  static const urlSearchMovies =
      "$baseApiUrltmdb/search/movie?api_key=$apiKey&language=en-US";
}
