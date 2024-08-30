import 'package:flutter_movie_app/api_manager/api_constants.dart';

class ApiPathes{
  static const String topSectionPath = '/movie/popular';
  static const String newReleasesMoviePath = '/movie/upcoming';
  static const String recommendedMoviesPath = '/movie/top_rated';
  static const String similarMoviesPath = '/similar';
  static const String movieVideosPath = '/videos';
  static const String categoryPath = '/3/genre/movie/list';
  static const String moviesByCategoryPath = '/discover/movie';



  static String buildURL({required String path}){
    return '${ApiConstants.baseUrl}$path';
  }

}