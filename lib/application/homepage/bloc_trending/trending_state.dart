part of 'trending_bloc.dart';

class TrendingState {
  final bool isLoading;
  final List<MovieModal>? trendingMoiveList;

  TrendingState({required this.isLoading, this.trendingMoiveList});
}

class TrendingInitial extends TrendingState {
  TrendingInitial({required super.isLoading});
}
