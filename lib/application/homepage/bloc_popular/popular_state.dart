part of 'popular_bloc.dart';

class PopularState {
  final bool isLoading;
  final List<MovieModal>? popularMoviesList;
  PopularState({required this.isLoading, this.popularMoviesList});
}

class PopularInitial extends PopularState {
  PopularInitial({required super.isLoading});
}
