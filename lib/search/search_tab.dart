import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:flutter_movie_app/search/search_item_widget.dart';

class SearchTab extends StatefulWidget {


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSearchTextField(),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return SizedBox(height: 10,);
                    },
                    itemCount: 10,
                      itemBuilder: (context,index){
                      var movie = MovieModel();
                      movie.title = 'Twisters';
                      movie.posterPath = "/pjnD08FlMAIXsfOLKQbvmO0f0MD.jpg";
                      movie.releaseDate = "2024-07-10";
                      movie.voteAverage = 7.016;
                      return SearchItemWidget(movie: movie);
                      }
                  ),
                )
              ],
            )
          ),
        )
    );
  }

  Widget _buildSearchTextField(){
    return TextField(
      cursorColor: AppColors.white,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: AppColors.white,width: 0.5)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: AppColors.white,width: 0.5)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: AppColors.white,width: 0.5)
        ),
        prefixIcon: Icon(Icons.search , color: AppColors.white,size: 30,),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
        filled: true,
        fillColor: AppColors.itemBackgroundColor
      )
    );
  }
}
