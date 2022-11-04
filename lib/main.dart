import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'models/app_theme.dart';
import 'models/dialog.dart';
import 'models/models.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme =  FooderlichTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager.instance),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
          ChangeNotifierProvider(create: (context) => ExploreDataManager()),
          ChangeNotifierProvider(create: (context) => SimpleRecipeManager()),
          ChangeNotifierProvider(create: (context) => Lightmanager()),
        ],
        child:  const Home(),
      ),
    );
  }
}
