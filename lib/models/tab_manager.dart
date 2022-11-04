import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;

  void goToTab(index) {
    selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    selectedTab = 1;
    notifyListeners();
  }

  /// private constructor
  TabManager._();
  /// the one and only instance of this singleton
  static final instance = TabManager._();


}