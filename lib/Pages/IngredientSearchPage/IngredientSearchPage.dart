import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Components/TitleBar.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class IngredientSearchPage extends StatelessWidget {
  const IngredientSearchPage({super.key});

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
      'Pasta',
      'Tomato',
      'Onion',
      'Garlic',
      'Onion',
      'Garlic',
      'Spices',
      'Cheese',
      'Meat',
    ];

    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            TitleBar(
              size: size,
              innerBoxIsScrolled: innerBoxIsScrolled,
              title: innerBoxIsScrolled ? "Search Based on Ingredients" : "Search Based on \n Ingredients",
            )
          ];
        },
        
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchInput(),
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    "Bahan yang sering digunakan",
                  ),
                ),
                SizedBox(
                  height: 800,
                  child: GridView.builder(
                    controller: ScrollController(
                      keepScrollOffset: true,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = ingredients[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(largeRounded),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(ingredient),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),));
  }
}

