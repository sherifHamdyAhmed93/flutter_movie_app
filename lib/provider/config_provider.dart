import 'package:flutter/material.dart';

// For the future, if we add a new mode like light
class ConfigThemeProvider extends ChangeNotifier {

  ThemeMode Theme = ThemeMode.light ;

  void ChangeTheme(ThemeMode mode){

    if(Theme == mode){
      return ;
    } else {
      Theme = mode ;
      notifyListeners();
    }
  }

  bool IsDarkMode(){
    return Theme == ThemeMode.dark ;
  }

  bool IsLightMode(){
    return Theme == ThemeMode.light;
  }

}