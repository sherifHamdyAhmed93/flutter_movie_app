import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/BookmarkButton.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class RecommendedMovieItem extends StatelessWidget {
  const RecommendedMovieItem({super.key});

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
                   Image.network(
                    width: double.infinity,
                    'https://marketplace.canva.com/EAFVOC6TAng/1/0/1131w/canva-yellow-and-white-action-movie-poster-_GG58WASM1E.jpg',
                    fit: BoxFit.fill,
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
                   Text('Deadpool 2',style: Theme.of(context).textTheme.displaySmall,),
                   SizedBox(height: 4,),
                   Text('2018  R  1h 59m',style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,),
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
