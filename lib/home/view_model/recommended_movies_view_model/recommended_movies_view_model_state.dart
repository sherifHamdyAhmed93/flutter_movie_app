part of 'recommended_movies_view_model.dart';

final class RecommendedMoviesViewModelState {}

final class RecommendedMoviesViewModelLoading extends RecommendedMoviesViewModelState {}

final class RecommendedMoviesViewModelError extends RecommendedMoviesViewModelState {
  String errorMessage;
  RecommendedMoviesViewModelError({required this.errorMessage});
}

final class RecommendedMoviesViewModelDataFetched extends RecommendedMoviesViewModelState {
  List<MovieModel> movies;
  RecommendedMoviesViewModelDataFetched({required this.movies});
}
