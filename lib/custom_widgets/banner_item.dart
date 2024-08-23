import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.3, // Set the desired height
      decoration: BoxDecoration(
        color: AppColors.itemBackgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image.network(
          'https://marketplace.canva.com/EAFVOC6TAng/1/0/1131w/canva-yellow-and-white-action-movie-poster-_GG58WASM1E.jpg',
          fit: BoxFit.cover, // Ensure the image covers the container
          width: double.infinity,
          height: double.infinity,
        ),
          // Applying blur effect
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
                HorizontalMovieItem(),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Text('Dora and the lost city of gold',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14),),
                    SizedBox(height: 4,),
                    Text('2019  PG-13  2h 7m',style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 10,),

                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
