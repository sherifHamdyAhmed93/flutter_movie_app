import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';

part 'search_movies_view_model_state.dart';

class SearchMoviesViewModel extends Cubit<SearchMoviesViewModelState> {
  int page = 1;

  TextEditingController  searchTextController = TextEditingController();

  SearchMoviesViewModel() : super(SearchMoviesViewModelInitState()){
  }

  Future<void> searchMovie() async{
    if (state is SearchMoviesViewModelLoading) {
      emit(SearchMoviesViewModelLoading());
    }
    try{
      final response = await ApiManager.searchMovies(query: searchTextController.text,page: page);
      List<MovieModel> updatedMovies;

      if (page == 1) {
        // Reset the articles list if page is 1
        updatedMovies = response?.results ?? [];
      } else {
        // Append the new articles to the current list if page > 1
        if (state is SearchMoviesViewModelLoadMoreData) {
          final currentState = state as SearchMoviesViewModelLoadMoreData;
          updatedMovies = currentState.movies + (response?.results ?? []);
        } else {
          updatedMovies = response?.results ?? [];
        }
      }

      emit(SearchMoviesViewModelDataFetched(movies: updatedMovies));
    }catch (e){
      emit(SearchMoviesViewModelError(errorMessage: e.toString()));
    }
  }

  void loadMore() {
    page += 1;
    if(state is SearchMoviesViewModelDataFetched){
      final currentState = state as SearchMoviesViewModelDataFetched;
      emit(SearchMoviesViewModelLoadMoreData(movies: currentState.movies));
    }
    searchMovie();
  }

}

