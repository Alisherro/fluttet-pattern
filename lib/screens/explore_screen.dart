import 'package:flutter/material.dart';
import 'package:fooderlich/screens/pizza_screen.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../models/explore_recipe.dart';
import '../models/models.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreDataManager>(
      builder: (context, exploreDataManager, child) {
        final manager = Provider.of<ExploreDataManager>(context, listen: false);
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            TodayRecipeListView(recipes: manager.exploreRecipe),
            const SizedBox(height: 16),
            FriendPostListView(friendPosts: manager.posts),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 16),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Pizza',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaWidget(),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
