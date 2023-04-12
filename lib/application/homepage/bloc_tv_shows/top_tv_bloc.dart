import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/tv_shows_repositary.dart';

part 'top_tv_event.dart';
part 'top_tv_state.dart';

class TopTvBloc extends Bloc<TopTvEvent, TopTvState> {
  TopTvBloc() : super(TopTvInitial(isLoading: false)) {
    // event handling
    on<FetchTopTvShowsEvent>((event, emit) async {
      // Event only Runs - if this list is empty
      if (state.topTvShowsList == null) {
        emit(TopTvState(isLoading: true));
        final apiData = await RepositaryTv(applyUrl: ApiEndPoint.urlTopTenTv)
            .getTvShowsMethod();
        emit(TopTvState(isLoading: false, topTvShowsList: apiData));
      }
    });
  }
}
