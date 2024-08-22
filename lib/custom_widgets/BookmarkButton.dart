import 'package:flutter/material.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false; // Initial state

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
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
