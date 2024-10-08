import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/BookmarkButton.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/movie_details_screen/movie_details_screen.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class GridMovieItem extends StatelessWidget {
  GridMovieItem({super.key,required this.movie});
  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: movie);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25), // Shadow color
                blurRadius: 4, // Blur intensity
                offset: Offset(0, 4), // Horizontal and vertical offset
              ),
            ],
            color: AppColors.itemBackgroundColor, borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3/2.4,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CachedNetworkImage(
                    imageUrl: movie.getFullPosterImagePath() ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.gold,)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Positioned(
                      top: -10,
                      left: -10,
                      child: BookmarkButton(movie: movie,)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star,color: AppColors.gold,size: 20,),
                      SizedBox(width: 2,),
                      Text('${movie.voteAverage?.toStringAsFixed(2)}',style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),)
                    ],
                  ),
                  SizedBox(height: 4,),
                  Text('${movie.title}',maxLines: 2,style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15),),
                  SizedBox(height: 4,),
                  Text(movie.getDateWithGenresAndDuration(),maxLines: 1,style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13),overflow: TextOverflow.ellipsis,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
