import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../models/models.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleRecipeManager>(
      builder: (context, simpleRecipeManager, child) {
        final manager =
            Provider.of<SimpleRecipeManager>(context, listen: false);
        return RecipesGridView(recipes: manager.simpleRecipes);
      },
    );
  }
}
