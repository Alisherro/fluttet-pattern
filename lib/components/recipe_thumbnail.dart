import 'package:flutter/material.dart';

import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeItemScreen(
              recipe: recipe,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  recipe.dishImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipe.title,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              recipe.duration,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}

class RecipeItemScreen extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeItemScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                recipe.dishImage,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                recipe.title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Center(
              child: Text(
                recipe.duration,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recipe.information.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    recipe.information[index],
                    style: Theme.of(context).textTheme.headline3,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
