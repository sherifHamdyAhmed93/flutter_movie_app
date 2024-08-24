import 'dart:convert';

import 'package:flutter_movie_app/api_manager/api_constants.dart';
import 'package:flutter_movie_app/api_manager/api_pathes.dart';
import 'package:flutter_movie_app/api_manager/error_messages.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/data_model/movies_response.dart';
import 'package:http/http.dart' as http;
class ApiManager{

  static Future<MoviesResponse?> getTopMovies()async{
    final String urlString = ApiPathes.buildURL(path: ApiPathes.topSectionPath);
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

  static Future<MoviesResponse?> getRecommendedMovies()async{
    final String urlString = ApiPathes.buildURL(path: ApiPathes.recommendedMoviesPath);
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

  static Future<MoviesResponse?> getNewReleasesMovies()async{
    final String urlString = ApiPathes.buildURL(path: ApiPathes.newReleasesMoviePath);
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

  static Future<MovieModel?> getMovieDetails(int movieId)async{
    final String urlString = ApiPathes.buildURL(path: '/$movieId');
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
    final String urlString = ApiPathes.buildURL(path: '/$movieId${ApiPathes.similarMoviesPath}');
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


}