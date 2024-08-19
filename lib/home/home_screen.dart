import 'package:flutter/material.dart';
import 'package:flutter_movie_app/browse/browse_tab.dart';
import 'package:flutter_movie_app/home/home_tab.dart';
import 'package:flutter_movie_app/watch_list/watch_list_tab.dart';

import '../search/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme
            .of(context)
            .primaryColor,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent
        ),
        child: BottomNavigationBar(

            iconSize: 30,
            selectedLabelStyle: Theme
                .of(context)
                .textTheme
                .bodySmall,
            unselectedLabelStyle: Theme
                .of(context)
                .textTheme
                .bodySmall,


            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search,),
                label: 'SEARCH',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'BROWSE',

              ),
              BottomNavigationBarItem(icon: Icon(Icons.book),
                  label: 'WATCHLIST'),

            ]),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchListTab()];
}
