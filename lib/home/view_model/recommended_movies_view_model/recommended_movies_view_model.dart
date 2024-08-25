import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';

part 'recommended_movies_view_model_state.dart';

class RecommendedMoviesViewModel extends Cubit<RecommendedMoviesViewModelState> {
  RecommendedMoviesViewModel() : super(RecommendedMoviesViewModelLoading()){
    getRecommendedMovies();
  }

  Future<void> getRecommendedMovies() async{
    try{
      final response = await ApiManager.getRecommendedMovies();
      emit(RecommendedMoviesViewModelDataFetched(movies: response?.results ?? []));
    }catch (e){
      emit(RecommendedMoviesViewModelError(errorMessage: e.toString()));
    }
  }

}

