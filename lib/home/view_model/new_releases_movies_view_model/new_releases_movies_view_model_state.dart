part of 'new_releases_movies_view_model.dart';

final class NewReleasesMoviesViewModelState {}

final class NewReleasesMoviesViewModelLoading extends NewReleasesMoviesViewModelState {}

final class NewReleasesMoviesViewModelError extends NewReleasesMoviesViewModelState {
  String errorMessage;
  NewReleasesMoviesViewModelError({required this.errorMessage});
}

final class NewReleasesMoviesViewModelDataFetched extends NewReleasesMoviesViewModelState {
  List<MovieModel> movies;
  NewReleasesMoviesViewModelDataFetched({required this.movies});
}
