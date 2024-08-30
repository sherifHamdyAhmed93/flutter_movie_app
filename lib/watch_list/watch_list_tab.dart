import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_movie_app/watch_list/watch_list_item.dart';
import 'package:provider/provider.dart';

import '../my_theme/app_colors.dart';
import '../provider/provider_watchlist.dart';

class WatchListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var providerWatchList = Provider.of<ProviderWatchList>(context);
    if (providerWatchList.movies.isEmpty) {
      providerWatchList.getAllTasksFromFireStore();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.watchlist),
          centerTitle: false,
        ),
        body: providerWatchList.movies.isEmpty ?
        Center(child: Text('No movies in your watchlist.'))
            :
        ListView.separated(

          itemCount: providerWatchList.movies.length,
          itemBuilder: (context, index) {
            return WatchListItem(movie: providerWatchList.movies[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Divider(
                color: AppColors.whitegray,
                height: 10,

              ),
            );
          },
        )


    );
  }
}
