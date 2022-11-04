import 'package:flutter/cupertino.dart';

import 'models.dart';

class ExploreData {
  final List<ExploreRecipe> todayRecipes;
  final List<Post> friendPosts;

  ExploreData(
    this.todayRecipes,
    this.friendPosts,
  );
}

class ExploreDataManager extends ChangeNotifier{
  final List<ExploreRecipe> _recipes = [
    ExploreRecipe(
      id: '1',
      cardType: 'card1',
      title: 'The Art of Dough',
      subtitle: "Editor's Choice",
      backgroundImage: 'assets/magazine_pics/card_bread.jpg',
      backgroundImageSource:
      'https://www.foodiesfeed.com/free-food-photo/baker-with-wheat-flour/',
      message: 'Learn to make the perfect bread.',
      authorName: 'Ray Wenderlich',
      role: 'Founder of Raywenderlich',
      profileImage: 'assets/profile_pics/person_ray.jpeg',
      durationInMinutes: 15,
      dietType: '🌯Standard',
      calories: 136,
      tags: ['Carbs', 'Dough', 'Crunchy', 'Yummy'],
      description:
      'food made of flour, water, and yeast or another leavening agent',
      source: 'Apple Dictionary',
      ingredients: [
        Ingredients(
            imageUrl: 'food_flour.jpg',
            title: 'Flour',
            source:
            'https://pixabay.com/photos/bake-butter-flour-mountain-pile-599521/'),
        Ingredients(
            imageUrl: 'food_dozen_eggs.jpg',
            title: 'Dozen Eggs',
            source:
            'https://pixabay.com/photos/egg-hen-s-egg-food-nutrition-1374141/')
      ],
      instructions: [
        Instruction(
            imageUrl: 'food_flour.jpg',
            description: 'Pour the flour on the table.',
            durationInMinutes: 5),
        Instruction(
            imageUrl: 'food_dozen_eggs.jpg',
            description: 'Mix the eggs with the flour. ',
            durationInMinutes: 5)
      ],
    ),
    ExploreRecipe(
      id: '2',
      cardType: 'card2',
      title: 'Recipe',
      subtitle: 'Smoothies',
      backgroundImage: 'assets/magazine_pics/card_smoothie.png',
      backgroundImageSource:
      'https://www.foodiesfeed.com/free-food-photo/peanut-butter-and-banana-smoothie/',
      message: 'Much Tasty, Wow Smooth, Oh Nutty',
      authorName: 'Mike Katz',
      role: 'Smoothie Connoisseur',
      profileImage: 'assets/profile_pics/person_katz.jpeg',
      durationInMinutes: 15,
      dietType: '🌯Standard',
      calories: 136,
      tags: ['Drink', 'Nuts', 'Smooth', 'Energy'],
      description:
      'a thick, smooth drink of fresh fruit pureed with milk, yogurt, or ice',
      source: 'Apple Dictionary',
      ingredients: [
        Ingredients(
            imageUrl: 'food_peanutbutter.png',
            title: 'Peanut Butter',
            source:
            'https://pixabay.com/photos/almond-blue-cook-cooking-egg-fat-1850615/'),
        Ingredients(
            imageUrl: 'food_soymilk.png',
            title: 'Soy Milk',
            source:
            'https://pixabay.com/photos/soy-milk-soy-soybean-soy-milk-2263942/'),
        Ingredients(
            imageUrl: 'food_banana.jpg',
            title: 'Banana',
            source:
            'https://pixabay.com/photos/bananas-fruit-food-fresh-mature-3700718/')
      ],
      instructions: [
        Instruction(
            imageUrl: 'food_banana.jpg',
            description: 'Peel the banana, cut it in half and place it in the',
            durationInMinutes: 1),
        Instruction(
            imageUrl: '',
            description: 'Add two big scoops of peanut butter. ',
            durationInMinutes: 1),
        Instruction(
            imageUrl: '',
            description: 'Add 2 cups of almond milk. Depending on the portion ',
            durationInMinutes: 5)
      ],
    ),
    ExploreRecipe(
      id: '3',
      cardType: 'card1',
      title: 'Delicious Salad',
      subtitle: 'Healthy Foods',
      backgroundImage: 'assets/magazine_pics/card_salad.png',
      backgroundImageSource:
      'https://www.foodiesfeed.com/free-food-photo/green-salad-with-bread/',
      message: 'Learn how to make a killer salad',
      authorName: 'Kevin Moore',
      role: 'Author at RW',
      profileImage: 'assets/profile_pics/person_kevin.jpeg',
      durationInMinutes: 15,
      dietType: '🌱Vegan',
      calories: 136,
      tags: ['Healthy', 'Salads', 'Lunch'],
      description: 'a cold dish of various mixtures of raw or cooked vegetable',
      source: 'Apple Dictionary',
      ingredients: [
        Ingredients(
            imageUrl: 'food_cucumber.jpg',
            title: 'Cucumber',
            source:
            'https://pixabay.com/photos/cucumbers-vegetables-green-healthy-849269/'),
        Ingredients(
            imageUrl: 'food_green_beans.jpg',
            title: 'Green beans',
            source:
            'https://pixabay.com/photos/beans-vegetables-green-market-4785/'),
        Ingredients(
            imageUrl: 'food_brussels_sprouts.jpg',
            title: 'Brussel Sprouts',
            source:
            'https://pixabay.com/photos/brussels-sprouts-vegetables-sprouts-22009/')
      ],
      instructions: [
        Instruction(
            imageUrl: 'food_cucumber.jpg',
            description: 'Cut the cucumber up into many pieces.',
            durationInMinutes: 3),
        Instruction(
            imageUrl: '',
            description: 'Wash the green beans well with salt. ',
            durationInMinutes: 2),
        Instruction(
            imageUrl: '',
            description: 'Peel the first layer of brussel sprout leaves',
            durationInMinutes: 5),
        Instruction(
            imageUrl: '',
            description: 'Place everything in a clean bowl. ',
            durationInMinutes: 5),
      ],
    ),
    ExploreRecipe(
      id: '4',
      cardType: 'card3',
      title: 'Recipe Trends',
      subtitle: '',
      backgroundImage: 'assets/magazine_pics/card_carrot.png',
      backgroundImageSource:
      'https://www.foodiesfeed.com/free-food-photo/fresh-carrots-from-a-market/',
      message: 'Trends of what people are making',
    ),
  ];
  List<ExploreRecipe> get exploreRecipe=> List.unmodifiable(_recipes);

  final List<Post> _post=[
    Post(
        id: '1',
        profileImageUrl: 'assets/profile_pics/person_cesare.jpeg',
        comment: 'Made this delicious pizza this morning',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '10'
    ),
    Post(
        id: '2',
        profileImageUrl: 'assets/profile_pics/person_stef.jpeg',
        comment: 'Made delicious creamy, shrimp black pepper pasta',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '80'
    ),
    Post(
        id: '3',
        profileImageUrl: 'assets/profile_pics/person_crispy.png',
        comment: 'Made a delicious salad today',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '20'
    ),
    Post(
        id: '4',
        profileImageUrl: 'assets/profile_pics/person_joe.jpeg',
        comment: 'Cooked a widget this morning',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '30'
    ),
    Post(
        id: '5',
        profileImageUrl: 'assets/profile_pics/person_katz.jpeg',
        comment: 'Going to power through my day with this nutty smoothie!',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '40'
    ),
    Post(
        id: '6',
        profileImageUrl: 'assets/profile_pics/person_kevin.jpeg',
        comment: 'Cooking up some steak 🥩 today, state should be rare',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '50'
    ),
    Post(
        id: '7',
        profileImageUrl: 'assets/profile_pics/person_sandra.jpeg',
        comment: 'Kicking off the morning with mike s green smoothie recipe',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '50'
    ),
    Post(
        id: '8',
        profileImageUrl: 'assets/profile_pics/person_manda.png',
        comment: 'Not sure where I should travel to eat today',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '60'
    ),
    Post(
        id: '9',
        profileImageUrl: 'assets/profile_pics/person_ray.jpeg',
        comment: 'Hot off the press, cooking up more books this year',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '70'
    ),
    Post(
        id: '10',
        profileImageUrl: 'assets/profile_pics/person_tiffani.jpeg',
        comment: 'Hmmm.... Salmon, little broccoli, mash potatos',
        foodPictureUrl: 'card_carrot.png',
        timestamp: '90'
    ),
  ];

  List<Post> get posts=> List.unmodifiable(_post);
}