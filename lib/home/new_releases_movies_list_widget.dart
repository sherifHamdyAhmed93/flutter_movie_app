import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/custom_widgets/error_widget.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/home/view_model/new_releases_movies_view_model/new_releases_movies_view_model.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NewReleasesMoviesListWidget extends StatefulWidget {
  const NewReleasesMoviesListWidget({super.key});

  @override
  State<NewReleasesMoviesListWidget> createState() => _NewReleasesMoviesListWidgetState();
}

class _NewReleasesMoviesListWidgetState extends State<NewReleasesMoviesListWidget> {
  late NewReleasesMoviesViewModel newReleasesMoviesViewModel;

  @override
  void initState() {
    // TODO: implement initState
    newReleasesMoviesViewModel = NewReleasesMoviesViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        NewReleasesMoviesViewModel,
        NewReleasesMoviesViewModelState>(
        bloc: newReleasesMoviesViewModel,
        builder: (context, state) {
          if (state is NewReleasesMoviesViewModelDataFetched) {
            if (state.movies.isEmpty) {
              return SizedBox();
            } else {
              return buildRecommendMovieSection(state.movies);
            }
          } else if (state is NewReleasesMoviesViewModelError) {
            return TryAgainWidget(errorMessage: state.errorMessage,
                onError: newReleasesMoviesViewModel.getNewReleasesMovies);
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.gold,),);
          }
        }
    );
  }

  Widget buildRecommendMovieSection(List<MovieModel> movies) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.26,
      padding: EdgeInsets.all(15),
      color: AppColors.containerBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.new_releases, style: Theme
              .of(context)
              .textTheme
              .headlineSmall),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontalMovieItem(movie: movies[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10,);
              },
            ),
          ),
        ],
      ),
    );
  }
}