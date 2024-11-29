import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:flutter/cupertino.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      'Pasta',
      'Tomato',
      'Onion',
      'Garlic',
      'Spices',
      'Cheese',
      'Meat',
    ];
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 800,
      child: GridView.builder(
          controller: ScrollController(
            keepScrollOffset: true,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return const RecipeCard();
          }),
    );
  }
}
