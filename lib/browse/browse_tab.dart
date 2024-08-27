import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';

import '../data_model/Category.dart';
import '../my_theme/app_colors.dart';
import 'category_item.dart';

class BrowseTab extends StatelessWidget {
  List<Category> categories = [];

  void initState() {
    ApiManager.getMovieCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.browse),
        centerTitle: false,
      ),
      body: FutureBuilder<List<Category>?>(
        future: ApiManager.getMovieCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.gold,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(category: categories[index]);
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
