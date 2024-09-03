import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:meta/meta.dart';

part 'movie_details_view_model_state.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsViewModelState> {
  int movieId;
  MovieDetailsViewModel({required this.movieId}) : super(MovieDetailsViewModelLoading()){
    getMovieDetails();
  }

  Future<void> getMovieDetails() async{
    try{
      final response = await ApiManager.getMovieDetails(movieId);
      emit(MovieDetailsViewModelDataFetched(movie: response!));
    }catch (e){
      emit(MovieDetailsViewModelError(errorMessage: e.toString()));
    }
  }

}