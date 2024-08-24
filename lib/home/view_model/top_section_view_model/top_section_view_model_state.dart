part of 'top_section_view_model_cubit.dart';

final class TopSectionViewModelState {}

final class TopSectionViewModelLoading extends TopSectionViewModelState {}

final class TopSectionViewModelError extends TopSectionViewModelState {
  String errorMessage;
  TopSectionViewModelError({required this.errorMessage});
}

final class TopSectionViewModelDataFetched extends TopSectionViewModelState {
  List<MovieModel> movies;
  TopSectionViewModelDataFetched({required this.movies});
}
