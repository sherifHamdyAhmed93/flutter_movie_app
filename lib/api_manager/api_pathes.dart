import 'package:flutter_movie_app/api_manager/api_constants.dart';

class ApiPathes{
  static const String topSectionPath = '/popular';
  static const String newReleasesMoviePath = '/upcoming';
  static const String recommendedMoviesPath = '/top_rated';

  static String buildURL({required String path}){
    return '${ApiConstants.baseUrl}$path';
  }

}