import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/movies_repositay.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial(isLoading: false)) {
    // on event
    on<FetchTrendingMoviesEvent>((event, emit) async {
      if (state.trendingMoiveList == null) {
        emit(TrendingState(isLoading: true));
        final apiata =
            await RepositaryMovies(applyUrl: ApiEndPoint.urlTrendingMovies)
                .getMoviesMethod();
        emit(TrendingState(isLoading: false, trendingMoiveList: apiata));
      }
    });
  }
}
