import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/BookmarkButton.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class HorizontalMovieItem extends StatelessWidget {
  HorizontalMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.28;
    final double height = width * 1.5; // Adjust height to maintain aspect ratio

    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned.fill(
            child: Image.network(
              'https://marketplace.canva.com/EAFVOC6TAng/1/0/1131w/canva-yellow-and-white-action-movie-poster-_GG58WASM1E.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: -10, // Adjust as needed to fit within the container
            left: -10, // Adjust as needed to fit within the container
            child: BookmarkButton(),
          ),
        ],
      ),
    );
  }
}
