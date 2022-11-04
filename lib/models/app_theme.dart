import 'package:flutter/cupertino.dart';

class Lightmanager extends ChangeNotifier{
  bool isDark=false;
  void changeTheme(){
    isDark=!isDark;
    notifyListeners();
  }

}