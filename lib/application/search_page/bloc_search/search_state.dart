part of 'search_bloc.dart';

class SearchState {
  final bool isLoading;
  final List<MovieModal>? idleList;
  final List<MovieModal>? afterSearchedList;

  SearchState({
    required this.isLoading,
    this.idleList,
    this.afterSearchedList,
  });
}

class SearchInitial extends SearchState {
  SearchInitial({required super.isLoading});
}
