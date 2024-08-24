import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/custom_widgets/banner_item.dart';
import 'package:flutter_movie_app/custom_widgets/error_widget.dart';
import 'package:flutter_movie_app/home/view_model/top_section_view_model_cubit.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class TopSectionMoviesListWidget extends StatefulWidget {
   TopSectionMoviesListWidget({super.key});

  @override
  State<TopSectionMoviesListWidget> createState() => _TopSectionMoviesListWidgetState();
}

class _TopSectionMoviesListWidgetState extends State<TopSectionMoviesListWidget> {
  late TopSectionViewModel topSectionViewModel;

  @override
  void initState() {
    // TODO: implement initState
    topSectionViewModel = TopSectionViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopSectionViewModel,TopSectionViewModelState>(
        bloc: topSectionViewModel,
        builder: (context,state){
          if (state is  TopSectionViewModelDataFetched){
            if (state.movies.isEmpty){
              return SizedBox();
            }else{
              return Container(
                color: AppColors.gold,
                child: CarouselSlider.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context,itemIndex,pageViewIndex){
                    return BannerItem(movie: state.movies[itemIndex],);
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
          }else if (state is  TopSectionViewModelError){
            return TryAgainWidget(errorMessage: state.errorMessage, onError: topSectionViewModel.getPopularMovies);
          }else{
            return Center(child: CircularProgressIndicator(color: AppColors.gold,),);
          }
        }
    );
  }
}
