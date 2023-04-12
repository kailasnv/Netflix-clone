part of 'nowplaying_bloc.dart';

@immutable
abstract class NowplayingEvent {}

class FetchNowPlayingMoviesEvent extends NowplayingEvent {}
