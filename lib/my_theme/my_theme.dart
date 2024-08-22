import 'package:flutter/material.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';


class MyThemeData{
  static final ThemeData MainMode = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    canvasColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0 ,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.white
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: AppColors.white
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.white
      ),
        bodySmall: GoogleFonts.inter(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: AppColors.whitegray
        ),
        bodyMedium: GoogleFonts.inter(
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
      selectedLabelStyle:  GoogleFonts.inter(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: AppColors.gold
      ),
      unselectedLabelStyle:GoogleFonts.inter(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: AppColors.white
      )
    ),
  );

  static final ThemeData lightMode = ThemeData();
}