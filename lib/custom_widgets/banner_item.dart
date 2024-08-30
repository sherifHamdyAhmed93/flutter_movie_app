import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/custom_widgets/play_button_widget.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/movie_details_screen/movie_details_screen.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class BannerItem extends StatelessWidget {
  BannerItem({super.key,required this.movie});
  MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: movie);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.itemBackgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
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
              errorWidget: (context, url, error) => Center(child:Icon(Icons.error,color: Colors.red,size: MediaQuery.of(context).size.width * 0.1,)),
            ),
            Container(
              color: AppColors.black.withOpacity(0.1),
            ),
            Container(
              height: 80,
              width: double.infinity,
              color: AppColors.black,
            ),
            Positioned(
              left: 30,bottom: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HorizontalMovieItem(movie: movie,),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4,),
                      Text('${movie.title}',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14),),
                      SizedBox(height: 4,),
                      Text(movie.getDateWithGenresAndDuration(),style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),

                    ],
                  ),
                ],
              ),
            ),
            PlayButtonWidget(movieId: movie.id!),
          ],
        ),
      ),
    );
  }
}
