import 'dart:convert';

import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Pages/FavoritePage/DetailRecipe.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      child: FutureBuilder(
        future: DatabaseHelper.instance.fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final recipes = snapshot.data as List<Map<String, dynamic>>;
            if (recipes.isEmpty) {
              return const Center(child: Text('Tidak ada resep tersimpan.'));
            }
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(
                    id: int.parse(recipe['id']),
                    imageUrl: recipe['imageUrl'],
                    title: recipe['title'],
                    onTap: () {
                      () {
                        final ingredients = jsonDecode(recipe['ingredients']);
                        final steps = jsonDecode(recipe['steps']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRecipe(
                              id: recipe['id'],
                              title: recipe['title'],
                              imageUrl: recipe['imageUrl'],
                              ingredients: ingredients,
                              steps: steps,
                            ),
                          ),
                        );
                      }();
                    },
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
