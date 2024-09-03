import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/model/movie_model.dart';

part 'similar_movies_view_model_state.dart';

class SimilarMoviesViewModel extends Cubit<SimilarMoviesViewModelState> {
  int movieId;
  SimilarMoviesViewModel({required this.movieId}) : super(SimilarMoviesViewModelLoading()){
    getSimilarMovies();
  }

  Future<void> getSimilarMovies() async{
    try{
      final response = await ApiManager.getMoviesLikeThese(movieId);
      emit(SimilarMoviesViewModelDataFetched(movies: response?.results ?? []));
    }catch (e){
      emit(SimilarMoviesViewModelError(errorMessage: e.toString()));
    }
  }

}