import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/movies_repositay.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularInitial(isLoading: false)) {
    on<FetchPopularMoviesEvent>((event, emit) async {
      if (state.popularMoviesList == null) {
        emit(PopularState(isLoading: true));
        final apiData =
            await RepositaryMovies(applyUrl: ApiEndPoint.urlPopularMovies)
                .getMoviesMethod();
        emit(PopularState(isLoading: false, popularMoviesList: apiData));
      }
    });
  }
}
