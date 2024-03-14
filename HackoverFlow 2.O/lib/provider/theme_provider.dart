import 'package:lawtrix/themes/dark_theme.dart';
import 'package:lawtrix/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = lightTheme;
  ThemeData get theme => _theme;
  bool followsystem = true;
  bool darkmodeon = false;

  void toggleFollowSystem(){
    followsystem = !followsystem;
    notifyListeners();
  }
  void toggleTheme(){
    final isDefault = _theme == lightTheme;
    if(isDefault){
      _theme = darkTheme;
      darkmodeon = true;
    }else{
      _theme = lightTheme;
      darkmodeon = false;
    }
    notifyListeners();
  }
  
}
