import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/tv_shows_repositary.dart';

part 'tv_popu_event.dart';
part 'tv_popu_state.dart';

class TvPopuBloc extends Bloc<TvPopuEvent, TvPopuState> {
  TvPopuBloc() : super(TvPopuInitial(isLoading: false)) {
    on<TvPopuEvent>((event, emit) async {
      if (state.popularTvShowsList == null) {
        emit(TvPopuState(isLoading: true));
        final apiData = await RepositaryTv(applyUrl: ApiEndPoint.urlTvPopular)
            .getTvShowsMethod();
        emit(TvPopuState(isLoading: false, popularTvShowsList: apiData));
      }
    });
  }
}
