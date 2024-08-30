import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/custom_widgets/error_widget.dart';
import 'package:flutter_movie_app/custom_widgets/recommended_movie_item.dart';
import 'package:flutter_movie_app/data_model/Category.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/movies_by_catgeory_screen/grid_movie_item.dart';
import 'package:flutter_movie_app/movies_by_catgeory_screen/view_model/category_movies_view_model.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MoviesByCategoryScreen extends StatefulWidget {
  static const String routeName = 'movies_by_category';
  const MoviesByCategoryScreen({super.key});

  @override
  State<MoviesByCategoryScreen> createState() => _MoviesByCategoryScreenState();
}

class _MoviesByCategoryScreenState extends State<MoviesByCategoryScreen> {

  CategoryMoviesViewModel? viewModel;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)!.settings.arguments as Category;
    if (viewModel  == null){
      viewModel = CategoryMoviesViewModel(category: category);
    }
      return Scaffold(
      appBar: AppBar(title: Text('${category.name}'),centerTitle: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: BlocBuilder<
            CategoryMoviesViewModel,
            CategoryMoviesViewModelState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is CategoryMoviesViewModelDataFetched) {
                return _buildSearchResults(state.movies,state);
              }else if (state is CategoryMoviesViewModelLoadMoreData) {
                return _buildSearchResults(state.movies,state);
              } else if (state is CategoryMoviesViewModelError) {
                return TryAgainWidget(errorMessage: state.errorMessage,
                    onError: viewModel!.getMoviesByCategory);
              }else if (state is CategoryMoviesViewModelInitState){
                return _buildEmptyState();
              } else {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.gold,),);
              }
            }
            ),
      )
      );

  }

  Widget _buildSearchResults(List<MovieModel> movies,CategoryMoviesViewModelState state) {
    var isLoadMore = state is CategoryMoviesViewModelLoadMoreData;
    return movies!.isEmpty ?
    _buildEmptyState()
        :
    GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: MediaQuery.of(context).size.height*0.03,
          crossAxisSpacing: MediaQuery.of(context).size.height*0.02,
          childAspectRatio: 3/4, // Adjust the aspect ratio to better fit the design
      ),
      controller: scrollController,
      shrinkWrap: true,
      itemCount: isLoadMore ? movies.length + 1 : movies.length,
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return GridMovieItem(movie: movies[index],);
        } else {
          return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
        }
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
        child: Text(AppLocalizations.of(context)!.noMoviesFound)
    );
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && (viewModel!.state is! CategoryMoviesViewModelLoadMoreData)) {
      viewModel?.loadMore();
    }
  }

}
