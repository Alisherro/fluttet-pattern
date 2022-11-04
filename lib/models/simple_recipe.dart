import 'package:flutter/cupertino.dart';

class SimpleRecipe {
  String id;
  String dishImage;
  String title;
  String duration;
  String source;
  List<String> information;

  SimpleRecipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    required this.information,
  });
}

class SimpleRecipeManager extends ChangeNotifier {
  final List<SimpleRecipe> _simpleRecipes = [
    SimpleRecipe(
      id: 'rec1',
      dishImage: 'assets/food_pics/food_salmon.jpg',
      title: 'Smoked Salmon',
      duration: '30 mins',
      source: 'https://pixabay.com/photos/salmon-dish-food-meal-fish-518032/',
      information: [
        'Course: Main Course',
        'Price: Cheap',
        'Cuisine: Meditarrian',
        'Skill Level: Beginner',
        'Prep Time 5 minutes',
      ],
    ),
    SimpleRecipe(
      id: 'rec2',
      dishImage: 'assets/food_pics/food_cupcake.jpg',
      title: 'Chocolate Cup Cake',
      duration: '1 hour',
      source: 'https://pixabay.com/photos/cupcakes-dessert-frosting-food-690040/',
      information: [
        'Course: Dessert',
        'Price: Somewhat cheap',
        'Cuisine: American',
        'Skill Level: Amateur',
        'Prep Time 10 minutes',
      ],
    ),
    SimpleRecipe(
      id: 'rec3',
      dishImage: 'assets/food_pics/food_pancake.jpg',
      title: 'Rasberry Maple Pancake',
      duration: '30 mins',
      source: 'https://pixabay.com/photos/pancakes-maple-syrup-sweet-food-2291908/',
      information: [
        'Course: Breakfast',
        'Price: Cheap',
        'Cuisine: American',
        'Skill Level: Beginner',
        'Prep Time 5 minutes',
      ],
    ),
    SimpleRecipe(
      id: 'rec4',
      dishImage: 'assets/food_pics/food_spaghetti.jpg',
      title: 'Seafood Spaghetti',
      duration: '50 mins',
      source: 'https://pixabay.com/photos/spaghetti-drunken-line-food-pasta-960978/',
      information: [
        'Course: Main Course',
        'Price: Expensive',
        'Cuisine:Italian ',
        'Skill Level:Beginner ',
        'Prep Time 5 minutes',
      ],
    ),
    SimpleRecipe(
      id: 'rec5',
      dishImage: 'assets/food_pics/food_friedrice.jpg',
      title: 'Thai Fried Rice',
      duration: '35 mins',
      source: 'https://pixabay.com/photos/fried-rice-thai-food-thai-cuisine-3023040/',
      information: [
        'Course: Main Course',
        'Price: Cheap',
        'Cuisine: Thai',
        'Skill Level: Beginner',
        'Prep Time 5 minutes ',
      ],
    ),
    SimpleRecipe(
      id: 'rec6',
      dishImage: 'assets/food_pics/food_curry.jpg',
      title: 'Thai Green Curry',
      duration: '1 hour',
      source: 'https://pixabay.com/photos/green-curry-thai-food-3604721/',
      information: [
        'Course: Main Course',
        'Price: Medium',
        'Cuisine: Thai',
        'Skill Level: Amateur',
        'Prep Time 10 minutes',
      ],
    ),
    SimpleRecipe(
      id: 'rec7',
      dishImage: 'assets/food_pics/food_pho.jpg',
      title: 'Vietnamese Pho',
      duration: '1 hour',
      source: 'https://pixabay.com/photos/soup-pho-soup-vietnam-vietnamese-5250765/',
      information: [
        'Course: Main Course',
        'Price: Cheap',
        'Cuisine: Vietnamese',
        'Skill Level: Hard',
        'Prep Time 20 minutes',
      ],
    ),
    SimpleRecipe(
      id: 'rec8',
      dishImage: 'assets/food_pics/food_burger.jpg',
      title: 'Bacon Cheese Burger',
      duration: '30 min',
      source: 'https://pixabay.com/photos/burger-fast-food-hamburger-731298/',
      information: [
        'Course: Main Course',
        'Price: Cheap',
        'Cuisine: American',
        'Skill Level: Easy',
        'Prep Time 5 minutes ',
      ],
    ),
  ];

  List<SimpleRecipe> get simpleRecipes=>List.unmodifiable(_simpleRecipes);
}
