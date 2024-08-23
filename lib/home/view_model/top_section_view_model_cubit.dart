import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:meta/meta.dart';

part 'top_section_view_model_state.dart';

class TopSectionViewModel extends Cubit<TopSectionViewModelState> {
  TopSectionViewModel() : super(TopSectionViewModelLoading()){
    getPopularMovies();
  }

  Future<void> getPopularMovies() async{
    try{
      final response = await ApiManager.getTopMovies();
      emit(TopSectionViewModelDataFetched(movies: response?.results ?? []));
    }catch (e){
      emit(TopSectionViewModelError(errorMessage: e.toString()));
    }
  }

}

