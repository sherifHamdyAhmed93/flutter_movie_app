import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/custom_widgets/error_widget.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/custom_widgets/recommended_movie_item.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/home/view_model/recommended_movies_view_model/recommended_movies_view_model.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RecommendedMoviesListWidget extends StatefulWidget {
  const RecommendedMoviesListWidget({super.key});

  @override
  State<RecommendedMoviesListWidget> createState() => _RecommendedMoviesListWidgetState();
}

class _RecommendedMoviesListWidgetState extends State<RecommendedMoviesListWidget> {
  late RecommendedMoviesViewModel recommendedMoviesViewModel;

  @override
  void initState() {
    // TODO: implement initState
    recommendedMoviesViewModel = RecommendedMoviesViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedMoviesViewModel,RecommendedMoviesViewModelState>(
        bloc: recommendedMoviesViewModel,
        builder: (context,state){
          if (state is  RecommendedMoviesViewModelDataFetched){
            if (state.movies.isEmpty){
              return SizedBox();
            }else{
              return buildNewReleasesMovieSection(state.movies);
            }
          }else if (state is  RecommendedMoviesViewModelError){
            return TryAgainWidget(errorMessage: state.errorMessage, onError: recommendedMoviesViewModel.getRecommendedMovies);
          }else{
            return Center(child: CircularProgressIndicator(color: AppColors.gold,),);
          }
        }
    );
  }

  Widget buildNewReleasesMovieSection(List<MovieModel> movies) {
    return Container(
      height: MediaQuery.of(context).size.height*0.27,
      padding: EdgeInsets.all(15),
      color: AppColors.containerBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.recommended, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecommendedMovieItem(movie: movies[index],);
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
