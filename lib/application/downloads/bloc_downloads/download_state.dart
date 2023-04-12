part of 'download_bloc.dart';

class DownloadState {
  final bool isLoading;
  final List<MovieModal>? movieDetails;

  const DownloadState({
    required this.isLoading,
    this.movieDetails,
  });
}

class DownloadInitial extends DownloadState {
  const DownloadInitial({required super.isLoading});
}
