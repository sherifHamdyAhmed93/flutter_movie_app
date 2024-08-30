import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/custom_widgets/error_widget.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:flutter_movie_app/search/search_item_widget.dart';
import 'package:flutter_movie_app/search/view_model/search_movies_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchTab extends StatefulWidget {


  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late SearchMoviesViewModel viewModel;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = SearchMoviesViewModel();
    scrollController.addListener(onScroll);
  }

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
                SizedBox(height: 20,),
                BlocBuilder<SearchMoviesViewModel,SearchMoviesViewModelState>(
                  bloc: viewModel,
                    builder: (context,state){
                      if (state is SearchMoviesViewModelDataFetched) {
                        return _buildSearchResults(state.movies,state);
                      }else if (state is SearchMoviesViewModelLoadMoreData) {
                        return _buildSearchResults(state.movies,state);
                      } else if (state is SearchMoviesViewModelError) {
                        return TryAgainWidget(errorMessage: state.errorMessage,
                            onError: viewModel.searchMovie);
                      }else if (state is SearchMoviesViewModelInitState){
                        return _buildEmptyState();
                      } else {
                        return Center(
                          child: CircularProgressIndicator(color: AppColors.gold,),);
                      }
                    }
                )
              ],
            )
          ),
        )
    );
  }


  Widget _buildSearchResults(List<MovieModel> movies,SearchMoviesViewModelState state) {
    var isLoadMore = state is SearchMoviesViewModelLoadMoreData;
    return movies.isEmpty ?
    _buildEmptyState()
        :
    Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 20,);
          },
          controller: scrollController,
          itemCount: isLoadMore ? movies.length + 1 : movies.length,
          itemBuilder: (context, index) {
            if (index < movies.length) {
              return SearchItemWidget(movie: movies[index]);
            } else {
              return Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor));
            }
          }
      ),
    );
  }

  Widget _buildEmptyState() {
    return Expanded(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/no_movies.png'),
              SizedBox(height: 10,),
              Text(AppLocalizations.of(context)!.noMoviesFound)
            ],
          )
      ),
    );
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && (viewModel.state is! SearchMoviesViewModelLoadMoreData)) {
      viewModel.loadMore();
    }
  }

  Widget _buildSearchTextField(){
    return TextField(
      controller: viewModel.searchTextController,
      onChanged: (searchText){
        viewModel.searchMovie();
      },
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
