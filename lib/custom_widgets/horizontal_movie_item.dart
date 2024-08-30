import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/BookmarkButton.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/movie_details_screen/movie_details_screen.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class HorizontalMovieItem extends StatelessWidget {
  HorizontalMovieItem({super.key,required this.movie,this.disableTab = false});
  MovieModel movie;
  bool disableTab;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.28;
    final double height = width * 1.5; // Adjust height to maintain aspect ratio

    return InkWell(
      onTap: (){
        if (disableTab == false) {
          Navigator.pushNamed(
              context, MovieDetailsScreen.routeName, arguments: movie);
        }
      },
      child: Container(
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
              child: CachedNetworkImage(
                imageUrl: movie.getFullPosterImagePath() ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.gold,)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              top: -10, // Adjust as needed to fit within the container
              left: -10, // Adjust as needed to fit within the container
              child: BookmarkButton(movie: movie,),
            ),
          ],
        ),
      ),
    );
  }
}
