import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightMode = ThemeData(
    primaryColor: Color(0xff1A1A1A),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: Color(0xffffffff)
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color(0xffC6C6C6),
      selectedItemColor: Color(0xffFFBB3B),
      showUnselectedLabels: true,
    ),
  );
}