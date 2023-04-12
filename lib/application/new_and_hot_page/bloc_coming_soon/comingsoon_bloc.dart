import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/movies_repositay.dart';

part 'comingsoon_event.dart';
part 'comingsoon_state.dart';

class ComingsoonBloc extends Bloc<ComingsoonEvent, ComingsoonState> {
  ComingsoonBloc() : super(ComingsoonInitial(isLoading: false)) {
    on<FetchComingSoonMoviesEvent>((event, emit) async {
      if (state.comingSoonMoviesList == null) {
        emit(ComingsoonState(isLoading: true));
        final apiData =
            await RepositaryMovies(applyUrl: ApiEndPoint.urlUpcomingMovies)
                .getMoviesMethod();
        emit(ComingsoonState(isLoading: false, comingSoonMoviesList: apiData));
      }
    });
  }
}
