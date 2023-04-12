import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/movies_repositay.dart';
import 'package:netflix_app/core/backend/repositaries/tv_shows_repositary.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(const DownloadInitial(isLoading: false)) {
    on<FetchDownloadsPageMoviesEvent>((event, emit) async {
      if (state.movieDetails == null) {
        emit(const DownloadState(isLoading: true));
        final apiData = await RepositaryTv(applyUrl: ApiEndPoint.urlTopTenTv)
            .getTvShowsMethod();

        emit(DownloadState(isLoading: false, movieDetails: apiData));
      }
    });
  }
}
