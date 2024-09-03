part of 'similar_movies_view_model.dart';

final class SimilarMoviesViewModelState {}

final class SimilarMoviesViewModelLoading extends SimilarMoviesViewModelState {}

final class SimilarMoviesViewModelError extends SimilarMoviesViewModelState {
  String errorMessage;
  SimilarMoviesViewModelError({required this.errorMessage});
}

final class SimilarMoviesViewModelDataFetched extends SimilarMoviesViewModelState {
  List<MovieModel> movies;
  SimilarMoviesViewModelDataFetched({required this.movies});
}