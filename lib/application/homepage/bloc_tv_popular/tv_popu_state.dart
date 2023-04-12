part of 'tv_popu_bloc.dart';

class TvPopuState {
  final bool isLoading;
  final List<MovieModal>? popularTvShowsList;

  TvPopuState({required this.isLoading, this.popularTvShowsList});
}

class TvPopuInitial extends TvPopuState {
  TvPopuInitial({required super.isLoading});
}
