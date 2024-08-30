part of 'category_movies_view_model.dart';

final class CategoryMoviesViewModelState {}
final class CategoryMoviesViewModelInitState extends CategoryMoviesViewModelState {}

final class CategoryMoviesViewModelLoading extends CategoryMoviesViewModelState {}

final class CategoryMoviesViewModelError extends CategoryMoviesViewModelState {
  String errorMessage;
  CategoryMoviesViewModelError({required this.errorMessage});
}

final class CategoryMoviesViewModelDataFetched extends CategoryMoviesViewModelState {
  List<MovieModel> movies;
  CategoryMoviesViewModelDataFetched({required this.movies});
}

final class CategoryMoviesViewModelLoadMoreData extends CategoryMoviesViewModelState {
  List<MovieModel> movies;
  CategoryMoviesViewModelLoadMoreData({required this.movies});
}
