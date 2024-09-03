import 'dart:convert';

import 'package:flutter_movie_app/api_manager/api_constants.dart';
import 'package:flutter_movie_app/api_manager/api_pathes.dart';
import 'package:flutter_movie_app/api_manager/error_messages.dart';
import 'package:flutter_movie_app/model/Category.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:flutter_movie_app/model/movie_vid/Movie_videos_response.dart';
import 'package:flutter_movie_app/model/movies_response.dart';
import 'package:http/http.dart' as http;
class ApiManager{

  static Future<MovieModel?> getMovieDetails(int movieId)async{
    final String urlString = ApiPathes.buildURL(path: '/movie/$movieId');
    print(urlString);
    final Uri uri = Uri.parse(urlString);
    try{
      final response = await http.get(uri,headers: ApiConstants.getHeaders());
      if (ErrorMessages.isSuccess(response.statusCode)) {
        var bodyString = response.body;
        var jsonData = json.decode(bodyString);
        var result = MovieModel.fromJson(jsonData);
        return result;
      }else{
        throw Exception(ErrorMessages.getErrorMessage(response.statusCode));
      }
    }catch(e){
      throw e;
    }
  }

  static Future<MoviesResponse?> getMoviesLikeThese(int movieId)async{
    final String urlString = ApiPathes.buildURL(path: '/movie/$movieId${ApiPathes.similarMoviesPath}');
    print(urlString);
    final Uri uri = Uri.parse(urlString);
    try{
      final response = await http.get(uri,headers: ApiConstants.getHeaders());
      if (ErrorMessages.isSuccess(response.statusCode)) {
        var bodyString = response.body;
        var jsonData = json.decode(bodyString);
        var result = MoviesResponse.fromJson(jsonData);
        return result;
      }else{
        throw Exception(ErrorMessages.getErrorMessage(response.statusCode));
      }
    }catch(e){
      throw e;
    }
  }

  static Future<MovieVideosResponse?> getMovieVideos(int movieId)async{
    final String urlString = ApiPathes.buildURL(path: '/movie/$movieId${ApiPathes.movieVideosPath}');
    print(urlString);
    final Uri uri = Uri.parse(urlString);
    try{
      final response = await http.get(uri,headers: ApiConstants.getHeaders());
      if (ErrorMessages.isSuccess(response.statusCode)) {
        var bodyString = response.body;
        var jsonData = json.decode(bodyString);
        var result = MovieVideosResponse.fromJson(jsonData);
        return result;
      }else{
        throw Exception(ErrorMessages.getErrorMessage(response.statusCode));
      }
    }catch(e){
      throw e;
    }
  }

  static Future<List<Category>?> getMovieCategory() async {
    Uri url = Uri.https('api.themoviedb.org', ApiPathes.categoryPath, {
      'language': 'en-US',
    });

    var response = await http.get(url, headers: ApiConstants.getHeaders());

    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var categoryResponse = CategoryResponse.fromJson(json);
      return categoryResponse.genres;
    } catch (e) {
      throw e;
    }
  }


  static Future<MoviesResponse?> getMoviesByCategory({required int categoryId,int page = 1})async{
    final String urlString = ApiPathes.buildURL(path: ApiPathes.moviesByCategoryPath);

    final Map<String, String> queryParams = {
      'with_genres': '$categoryId',
      'page': '$page'
    };
    final Uri uri = Uri.parse(urlString).replace(queryParameters: queryParams);
    print('$uri');

    try{
      final response = await http.get(uri,headers: ApiConstants.getHeaders());
      if (ErrorMessages.isSuccess(response.statusCode)) {
        var bodyString = response.body;
        var jsonData = json.decode(bodyString);
        var result = MoviesResponse.fromJson(jsonData);
        return result;
      }else{
        throw Exception(ErrorMessages.getErrorMessage(response.statusCode));
      }
    }catch(e){
      throw e;
    }
  }

  static Future<MoviesResponse?> searchMovies({required String query,int page = 1})async{
    final String urlString = ApiPathes.buildURL(path: ApiPathes.searchMoviePath);

    final Map<String, String> queryParams = {
      'query': query,
      'page': '$page'
    };
    final Uri uri = Uri.parse(urlString).replace(queryParameters: queryParams);
    print('$uri');

    try{
      final response = await http.get(uri,headers: ApiConstants.getHeaders());
      if (ErrorMessages.isSuccess(response.statusCode)) {
        var bodyString = response.body;
        var jsonData = json.decode(bodyString);
        var result = MoviesResponse.fromJson(jsonData);
        return result;
      }else{
        throw Exception(ErrorMessages.getErrorMessage(response.statusCode));
      }
    }catch(e){
      throw e;
    }
  }

}