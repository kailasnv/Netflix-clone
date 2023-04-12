part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchIdleEvent extends SearchEvent {}

class SearchEnteredByUserEvent extends SearchEvent {
  final String movieQuery;

  SearchEnteredByUserEvent(this.movieQuery);
}
