import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/movie_model.dart';

import '../firebase/firbase_utils.dart';

class ProviderWatchList extends ChangeNotifier {
  List<MovieModel> movies = [];

  void getAllTasksFromFireStore() async {
    QuerySnapshot<MovieModel> querySnapshot =
    await FirebaseUtils.getMovieCollection().get();

    movies = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    notifyListeners();
  }
}