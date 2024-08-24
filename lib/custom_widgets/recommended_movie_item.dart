import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/BookmarkButton.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class RecommendedMovieItem extends StatelessWidget {
  RecommendedMovieItem({super.key,required this.movie});
  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/1.9,
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
            Expanded(
              flex: 2,
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
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(color: AppColors.gold,),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Positioned(
                      top: -10,
                      left: -10,
                      child: BookmarkButton()
                  )
                ],
              ),
            ),
            Expanded(
             flex: 1,
             child: Container(
               padding: EdgeInsets.only(left: 4,right: 4,bottom: 4,top: 2),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 4,),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Icon(Icons.star,color: AppColors.gold,size: 15,),
                       SizedBox(width: 2,),
                       Text('7.7',style: Theme.of(context).textTheme.displaySmall,)
                     ],
                   ),
                   SizedBox(height: 4,),
                   Text('${movie.title}',maxLines: 1,style: Theme.of(context).textTheme.displaySmall,),
                   SizedBox(height: 4,),
                   Text(movie.getDateWithGenresAndDuration(),maxLines: 1,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,),
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
