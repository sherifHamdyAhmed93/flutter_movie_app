part of 'movie_details_view_model_cubit.dart';

@immutable
sealed class MovieDetailsViewModelState {}

final class MovieDetailsViewModelLoading extends MovieDetailsViewModelState {}

final class MovieDetailsViewModelError extends MovieDetailsViewModelState {
  String errorMessage;
  MovieDetailsViewModelError({required this.errorMessage});
}

final class MovieDetailsViewModelDataFetched extends MovieDetailsViewModelState {
  MovieModel movie;
  MovieDetailsViewModelDataFetched({required this.movie});
}