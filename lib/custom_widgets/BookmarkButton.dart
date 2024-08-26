import 'package:flutter/material.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../data_model/movie_model.dart';
import '../firebase/firbase_utils.dart';
import '../provider/provider_watchlist.dart';

class BookmarkButton extends StatefulWidget {
  MovieModel movie;

  BookmarkButton({required this.movie});
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;
  late ProviderWatchList providerWatchList;

  void initState() {
    super.initState();
    checkIfBookmarked();
  }

  void checkIfBookmarked() async {
    isBookmarked = await FirebaseUtils.isMovieBookmarked(widget.movie);
    if (mounted) {
      setState(() {});
    }
  }

  void toggleBookmark() {
    if (isBookmarked) {
      FirebaseUtils.removeFromFirebase(widget.movie);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.movie.title} removed from watchList')),
      );
    } else {
      FirebaseUtils.addToFirebase(widget.movie);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.movie.title} added to watchList')),
      );
    }
    providerWatchList.getAllTasksFromFireStore();
    setState(() {
      isBookmarked = !isBookmarked; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    providerWatchList = Provider.of<ProviderWatchList>(context);
    return GestureDetector(
      onTap: toggleBookmark, // Handle tap to toggle the bookmark state
      child: Container(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.bookmark,
                color: isBookmarked ? AppColors.gold : AppColors.blackgray.withOpacity(0.5),
                size: 50,
              ),
            ),
            Center(
              child: Icon(
                isBookmarked ? Icons.check : Icons.add ,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
