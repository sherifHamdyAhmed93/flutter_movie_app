import 'package:flutter_movie_app/api_manager/api_constants.dart';

class ApiPathes{
  static const String topSectionPath = '/popular';
  static const String newReleasesMoviePath = '/upcoming';
  static const String recommendedMoviesPath = '/top_rated';
  static const String similarMoviesPath = '/similar';
  static const String movieVideosPath = '/videos';
  static const String categoryPath = '/3/genre/movie/list';

  static String buildURL({required String path}){
    return '${ApiConstants.baseUrl}$path';
  }

}