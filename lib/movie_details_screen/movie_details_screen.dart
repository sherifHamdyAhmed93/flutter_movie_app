import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/custom_widgets/error_widget.dart';
import 'package:flutter_movie_app/custom_widgets/horizontal_movie_item.dart';
import 'package:flutter_movie_app/data_model/Genres.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:flutter_movie_app/movie_details_screen/view_model/movie_details_view_model_cubit.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = 'movie_details';
  MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  MovieDetailsViewModel? movieDetailsViewModel;

  @override
  Widget build(BuildContext context) {
    MovieModel movie =ModalRoute.of(context)?.settings.arguments as MovieModel;
    return Scaffold(
      appBar: AppBar(title: Text('${movie.title}'),centerTitle: false,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildMovieDetailsWidget(movie.id),
            _buildHorizontalRecommendedMoviesList()
          ],
        ),
      ),
    );
  }

  Widget buildMovieDetailsWidget(int? movieId){
    if (movieDetailsViewModel ==  null){
      movieDetailsViewModel = MovieDetailsViewModel(movieId: movieId!);
    }

    return BlocBuilder<
        MovieDetailsViewModel,
        MovieDetailsViewModelState>(
        bloc: movieDetailsViewModel,
        builder: (context, state) {
          if (state is MovieDetailsViewModelDataFetched) {
           return Column(
             children: [
               _buildTopWidget(state.movie),
               Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     _buildMovieNameAndDate(state.movie.title ?? '',state.movie.getDateWithGenresAndDuration()),
                     SizedBox(height: 10,),
                     _buildMovieWithTypesAndDesc(state.movie)
                   ],
                 ),
               ),
             ],
           );
          } else if (state is MovieDetailsViewModelError) {
            return TryAgainWidget(errorMessage: state.errorMessage,
                onError: movieDetailsViewModel!.getMovieDetails);
          } else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.gold,),);
          }
        }
    );

  }

  Widget _buildTopWidget(MovieModel movie) {
    return Container(
      height: MediaQuery.of(context).size.width * 1/2,
      width: MediaQuery.of(context).size.width,
      child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            CachedNetworkImage(
              imageUrl: movie.getFullPosterImagePath() ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.gold,)),
              errorWidget: (context, url, error) => Center(child:Icon(Icons.error,color: Colors.red,size: MediaQuery.of(context).size.width * 0.1,)),
            ),
            Visibility(
              visible: movie.video ?? false,
              child: Positioned(
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
            ),
      ]),
    );
  }

  Widget _buildMovieNameAndDate(String title,String dateAndTime){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 18),),
        SizedBox(height: 6,),
        Text(dateAndTime,style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13)),
        SizedBox(height: 10,),
      ],
    );
  }

  Widget _buildMovieWithTypesAndDesc(MovieModel movie) {
    return  Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          HorizontalMovieItem(movie: movie,),
          const SizedBox(width: 10,),
          Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Here you get the available width for the Expanded widget
                  double remainingWidth = constraints.maxWidth;
                  return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildChips(availableWidth : remainingWidth,geners: movie.genres ?? []),
                        SizedBox(height: 10),
                        Text(
                          '${movie.overview}',
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 13),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,color: AppColors.gold,size: 20,),
                            SizedBox(width: 2,),
                            Text('${movie.voteAverage?.toStringAsFixed(2)}',style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 18),)
                          ],
                        ),
                      ],
                  );
                }
              )
          ),
        ],
      ),
    );
  }

  Widget _buildChips({required double availableWidth,required List<Genres> geners}) {
    const double spacing = 10;
    const int chipsPerRow = 3;

    // Calculate the width of each chip considering the spacing
    double chipWidth = (availableWidth - (spacing * (chipsPerRow - 1))) / chipsPerRow;

    return Wrap(
      spacing: spacing, // Horizontal space between chips
      runSpacing: 4, // Vertical space between chips
      children: List.generate(geners.length, (index) {
        return Container(
          width: chipWidth, // Force the width of the chip container
          child: Chip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: AppColors.blackgray),
            label: Center(
              child: Text(
                '${geners[index].name}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
              ),
            ),
          ),
        );
      }),
    );
  }


  Widget _buildHorizontalRecommendedMoviesList(){
    return Container(
      height: MediaQuery.of(context).size.height*0.27,
      padding: EdgeInsets.all(15),
      color: AppColors.containerBackgroundColor,
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
                return Container();//RecommendedMovieItem();
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
