part of 'search_movies_view_model.dart';

final class SearchMoviesViewModelState {}
final class SearchMoviesViewModelInitState extends SearchMoviesViewModelState {}

final class SearchMoviesViewModelLoading extends SearchMoviesViewModelState {}

final class SearchMoviesViewModelError extends SearchMoviesViewModelState {
  String errorMessage;
  SearchMoviesViewModelError({required this.errorMessage});
}

final class SearchMoviesViewModelDataFetched extends SearchMoviesViewModelState {
  List<MovieModel> movies;
  SearchMoviesViewModelDataFetched({required this.movies});
}

final class SearchMoviesViewModelLoadMoreData extends SearchMoviesViewModelState {
  List<MovieModel> movies;
  SearchMoviesViewModelLoadMoreData({required this.movies});
}
