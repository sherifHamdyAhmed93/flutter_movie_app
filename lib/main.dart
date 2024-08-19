import 'package:flutter/material.dart';
import 'package:flutter_movie_app/home/home_screen.dart';
import 'package:flutter_movie_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen()
      },
      theme: MyThemeData.lightMode,
    );
  }
}
