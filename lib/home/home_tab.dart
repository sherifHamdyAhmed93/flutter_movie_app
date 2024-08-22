import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/banner_item.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/custom_widgets/recommended_movie_item.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopBanner(),
          const SizedBox(height: 20,),
          _buildHorizontalMoviesList(),
          const SizedBox(height: 20,),
        _buildHorizontalRecommandedMoviesList(),
         const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget _buildTopBanner(){
    return Container(
      color: AppColors.gold,
      // height: MediaQuery.of(context).size.height*0.3,
      // width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (context,itemIndex,pageViewIndex){
          return BannerItem();
        },
        options: CarouselOptions(
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          aspectRatio: 1.4/1,
          viewportFraction: 1,
          // height: MediaQuery.of(context).size.height*0.3,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
        ),
      ),
    );
  }

  Widget _buildHorizontalMoviesList(){
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      padding: EdgeInsets.all(15),
      color: AppColors.blackgray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recomended', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontalMovieItem();
              },
              separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalRecommandedMoviesList(){
    return Container(
      height: MediaQuery.of(context).size.height*0.27,
      padding: EdgeInsets.all(15),
      color: AppColors.blackgray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recomended', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecommendedMovieItem();
              },
              separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              },
            ),
          ),
        ],
      ),
    );
  }
}



