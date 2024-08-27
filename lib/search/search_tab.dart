import 'package:flutter/material.dart';

import '../mode/api_manager.dart';
import '../mode/search_by_moviename.dart';
import '../my_theme/app_colors.dart';

class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var formKey = GlobalKey<FormState>();
  String query = '';
  Future<SearchByMoviename?>? searchResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.all(13),
      child: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.white, fontSize: 19),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      labelStyle: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: AppColors.white),
                      prefixIcon: Icon(Icons.search, color: AppColors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColors.blackgray),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        query = value;
                        searchResults = APIManager.searchMovie(query: query);
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<SearchByMoviename?>(
                future: searchResults,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data?.results == null || snapshot.data!.results!.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(height: 220),
                        Image.asset('assets/images/Nfound.png'),
                        SizedBox(height: 10),
                        Text('No movies found',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.whitegray, fontSize: 17)),
                      ],
                    );
                  } else {
                    var movies = snapshot.data!.results!;
                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return SearchResultsWidget(movie: movies[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}