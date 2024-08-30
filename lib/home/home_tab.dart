import 'package:flutter/material.dart';
import 'package:flutter_movie_app/custom_widgets/recommended_movie_item.dart';
import 'package:flutter_movie_app/home/new_releases_movies_list_widget.dart';
import 'package:flutter_movie_app/home/recommended_movies_list_widget.dart';
import 'package:flutter_movie_app/home/top_section_movies_list_widget.dart';
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
          TopSectionMoviesListWidget(),
          const SizedBox(height: 20,),
          NewReleasesMoviesListWidget(),
          const SizedBox(height: 20,),
          RecommendedMoviesListWidget(),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

}



