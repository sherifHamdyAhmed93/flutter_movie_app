import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/BookmarkButton.dart';
import 'package:flutter_movie_app/custom_widgets/star_widget.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/movie_details_screen/movie_details_screen.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class SearchItemWidget extends StatelessWidget {
  SearchItemWidget({super.key,required this.movie});
  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    var imageWidth = (MediaQuery.of(context).size.width-20) * 0.4;
    var imageHeight = imageWidth * 1/1.5;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, MovieDetailsScreen.routeName, arguments: movie);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Stack(
            alignment: Alignment.topLeft,
            children: [
              SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: CachedNetworkImage(
                  imageUrl: movie.getFullPosterImagePath() ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.gold,)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                  top: -10,
                  left: -10,
                  child: BookmarkButton(movie: movie,)
              )
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 6,
                ),
                Text(movie.getDateWithGenresAndDuration(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.whitegray)),
                SizedBox(
                  height: 6,
                ),
                RatingWidget(rating: movie.voteAverage ?? 0)
              ],
            ),
          ),
      
        ],
      ),
    );
  }

}
