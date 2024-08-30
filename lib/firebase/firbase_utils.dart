import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';

class FirebaseUtils {

  static CollectionReference<MovieModel> getMovieCollection() {
    return FirebaseFirestore.instance.collection('watchList').withConverter(
        fromFirestore: (snapshot, option) =>
            MovieModel.fromJson(snapshot.data()!),
        toFirestore: (movie, option) => movie.toJson());
  }

  static Future<void> addToFirebase(MovieModel movie) async {
    try {
      await getMovieCollection().
      doc(movie.id.toString()).set(movie);
    } catch (e) {
      print("Failed to add movie to watchlist: $e");
    }
  }

  static Future<void> removeFromFirebase(MovieModel movie) async {
    try {
      await getMovieCollection()
          .doc(movie.id.toString())
          .delete();
      print('movie deleted');
    } catch (e) {
      throw Exception('Failed to remove movie from watchlist: $e');
    }
  }

  static Future<bool> isMovieBookmarked(MovieModel movie) async {
    try {
      final doc = await getMovieCollection().doc(movie.id.toString()).get();
      return doc.exists;
    } catch (e) {
      print("Error checking bookmark status: $e");
      return false;
    }
  }
}

