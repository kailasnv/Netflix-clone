import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/movies_repositay.dart';

part 'nowplaying_event.dart';
part 'nowplaying_state.dart';

class NowplayingBloc extends Bloc<NowplayingEvent, NowplayingState> {
  NowplayingBloc() : super(NowplayingInitial(isLoading: false)) {
    on<FetchNowPlayingMoviesEvent>((event, emit) async {
      if (state.nowPlayingMoviesList == null) {
        emit(NowplayingState(isLoading: true));
        final apiData =
            await RepositaryMovies(applyUrl: ApiEndPoint.urlDiscoverMovies)
                .getMoviesMethod();

        emit(NowplayingState(isLoading: false, nowPlayingMoviesList: apiData));
      }
    });
  }
}
