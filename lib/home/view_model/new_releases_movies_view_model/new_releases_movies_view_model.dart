import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';

part 'new_releases_movies_view_model_state.dart';

class NewReleasesMoviesViewModel extends Cubit<NewReleasesMoviesViewModelState> {
  NewReleasesMoviesViewModel() : super(NewReleasesMoviesViewModelLoading()){
    getNewReleasesMovies();
  }

  Future<void> getNewReleasesMovies() async{
    try{
      final response = await ApiManager.getNewReleasesMovies();
      emit(NewReleasesMoviesViewModelDataFetched(movies: response?.results ?? []));
    }catch (e){
      emit(NewReleasesMoviesViewModelError(errorMessage: e.toString()));
    }
  }

}

