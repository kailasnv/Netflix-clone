import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/core/backend/api_end_point.dart';
import 'package:netflix_app/core/backend/movie_modal.dart';
import 'package:netflix_app/core/backend/repositaries/movies_repositay.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial(isLoading: false)) {
    // idle event

    on<SearchIdleEvent>((event, emit) async {
      if (state.idleList == null) {
        emit(SearchState(isLoading: true));
        final idleList =
            await RepositaryMovies(applyUrl: ApiEndPoint.urlTopRatedMovies)
                .getMoviesMethod();
        emit(SearchState(
          isLoading: false,
          idleList: idleList,
        ));
      }
    });

    // search any movies event

    on<SearchEnteredByUserEvent>((event, emit) async {
      final userSearch = event.movieQuery;
      // print("SEARCHING FOR $userSearch");

      emit(SearchState(isLoading: true));
      final searchedData = await RepositaryMovies(
              applyUrl:
                  "${ApiEndPoint.urlSearchMovies}&query=$userSearch&page=1&include_adult=false")
          .getMoviesMethod();
      emit(SearchState(isLoading: false, afterSearchedList: searchedData));
      /*
         if the user enters nothing or cancel the search -/ launch the idleList again
      */
      if (userSearch.isEmpty) {
        emit(SearchState(isLoading: true));
        final idleList =
            await RepositaryMovies(applyUrl: ApiEndPoint.urlTopRatedMovies)
                .getMoviesMethod();
        emit(SearchState(
          isLoading: false,
          idleList: idleList,
        ));
      }
    });
  }
}
