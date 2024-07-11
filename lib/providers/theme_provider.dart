import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  static const THEME_STATUS = "THEME_STATUS";
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider(){
    getTheme();
  }

  setDarkTheme({required bool themeValue}) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _darkTheme = preferences.getBool(THEME_STATUS)?? false;
    notifyListeners();
    return _darkTheme;
  }
}