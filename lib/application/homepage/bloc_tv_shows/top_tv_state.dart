part of 'top_tv_bloc.dart';

class TopTvState {
  final bool isLoading;
  final List<MovieModal>? topTvShowsList;
  TopTvState({required this.isLoading, this.topTvShowsList});
}

class TopTvInitial extends TopTvState {
  TopTvInitial({required super.isLoading});
}
