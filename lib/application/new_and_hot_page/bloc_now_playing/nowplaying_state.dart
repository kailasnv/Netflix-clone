part of 'nowplaying_bloc.dart';

class NowplayingState {
  final bool isLoading;
  final List<MovieModal>? nowPlayingMoviesList;

  NowplayingState({required this.isLoading, this.nowPlayingMoviesList});
}

class NowplayingInitial extends NowplayingState {
  NowplayingInitial({required super.isLoading});
}
