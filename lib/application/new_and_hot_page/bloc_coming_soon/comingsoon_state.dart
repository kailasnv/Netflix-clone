part of 'comingsoon_bloc.dart';

class ComingsoonState {
  final bool isLoading;
  final List<MovieModal>? comingSoonMoviesList;

  ComingsoonState({
    required this.isLoading,
    this.comingSoonMoviesList,
  });
}

class ComingsoonInitial extends ComingsoonState {
  ComingsoonInitial({required super.isLoading});
}
