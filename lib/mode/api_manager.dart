import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/mode/search_by_moviename.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_constants.dart';
import 'api_pathes.dart';

class APIManager {
  static Future<SearchByMoviename?> searchMovie({required String query}) async {
    try {
      String url = '${ApiPathes.buildURL(path: "/search/movie")}?api_key=${ApiConstants.apiKey}&query=$query';
      var response = await http.get(Uri.parse(url), headers: ApiConstants.getHeaders());

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return SearchByMoviename.fromJson(jsonResponse);
      } else {
        // Handle non-200 responses
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print("Error: $e");
      return null;
    }
  }
}

class SearchResultsWidget extends StatelessWidget {
  final Results movie;

  SearchResultsWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.posterPath != null
          ? Image.network(
        '${ApiConstants.imagesURL}w200${movie.posterPath}',
        fit: BoxFit.cover,
      )
          : Image.asset('assets/images/placeholder.png'), // Placeholder image
      title: Text(movie.title ?? 'Unknown Title'),
      subtitle: Text(movie.releaseDate != null ? movie.releaseDate!.split('-')[0] : 'Unknown Year'),
    );
  }
}