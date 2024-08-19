import 'package:flutter/material.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';



class MyThemeData{
  static final ThemeData MainMode = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0 ,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.white
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.white
      ),
        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.whitegray
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white
        ),
        displayLarge: TextStyle(),
      bodyLarge: TextStyle()),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.whitegray,
      selectedItemColor: AppColors.gold,
      showUnselectedLabels: true,
    ),
  );

  static final ThemeData lightMode = ThemeData();
}