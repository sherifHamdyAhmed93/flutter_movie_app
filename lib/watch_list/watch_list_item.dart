import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data_model/movie_model.dart';
import 'package:provider/provider.dart';

import '../firebase/firbase_utils.dart';
import '../movie_details_screen/movie_details_screen.dart';
import '../my_theme/app_colors.dart';
import '../provider/provider_watchlist.dart';


class WatchListItem extends StatefulWidget {
  MovieModel movie;

  WatchListItem({required this.movie});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  late ProviderWatchList providerWatchList;

  @override
  Widget build(BuildContext context) {
    providerWatchList = Provider.of<ProviderWatchList>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
              context, MovieDetailsScreen.routeName, arguments: widget.movie);
        },
        child: Container(

          margin: EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Row(

            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      widget.movie.getFullPosterImagePath() ?? '',
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.44,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.15,
                      fit: BoxFit.fill,),
                  ),
                  Positioned(
                    top: -10,
                    left: -10,
                    child: GestureDetector(
                      onTap: toggleBookmark,
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.bookmark,
                                color: AppColors.gold.withOpacity(0.8),
                                size: 55,
                              ),
                            ),
                            Center(
                              child: Icon(Icons.check,
                                color: Colors.white,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )


                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.movie.title ?? '',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 10,),
                    Text(widget.movie.getDateWithGenresAndDuration(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            color: AppColors.whitegray
                        )),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: AppColors.gold, size: 15,),
                        SizedBox(width: 2,),
                        Text('${widget.movie.voteAverage?.toStringAsFixed(2)}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                color: AppColors.whitegray
                            ))
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void toggleBookmark() {
    FirebaseUtils.removeFromFirebase(widget.movie);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.movie.title} removed from watchList')),
    );
    providerWatchList.getAllTasksFromFireStore();
  }
}