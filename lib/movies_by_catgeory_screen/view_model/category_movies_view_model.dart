import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/data_model/Category.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';

part 'category_movies_view_model_state.dart';

class CategoryMoviesViewModel extends Cubit<CategoryMoviesViewModelState> {
  Category category;
  int page = 1;
  CategoryMoviesViewModel({required this.category}) : super(CategoryMoviesViewModelLoading()){
    getMoviesByCategory();
  }

  Future<void> getMoviesByCategory() async{
    if (state is CategoryMoviesViewModelLoading) {
      emit(CategoryMoviesViewModelLoading());
    }
    try{
      final response = await ApiManager.getMoviesByCategory(categoryId: category.id ?? 0,page: page);
      List<MovieModel> updatedMovies;

      if (page == 1) {
        // Reset the articles list if page is 1
        updatedMovies = response?.results ?? [];
      } else {
        // Append the new articles to the current list if page > 1
        if (state is CategoryMoviesViewModelLoadMoreData) {
          final currentState = state as CategoryMoviesViewModelLoadMoreData;
          updatedMovies = currentState.movies + (response?.results ?? []);
        } else {
          updatedMovies = response?.results ?? [];
        }
      }

      emit(CategoryMoviesViewModelDataFetched(movies: updatedMovies));
    }catch (e){
      emit(CategoryMoviesViewModelError(errorMessage: e.toString()));
    }
  }

  void loadMore() {
    page += 1;
    if(state is CategoryMoviesViewModelDataFetched){
      final currentState = state as CategoryMoviesViewModelDataFetched;
      emit(CategoryMoviesViewModelLoadMoreData(movies: currentState.movies));
    }
    getMoviesByCategory();
  }

}

