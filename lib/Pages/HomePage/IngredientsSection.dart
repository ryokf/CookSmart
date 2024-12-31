import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class IngredientSection extends StatelessWidget {
  IngredientSection({super.key});

  final List<String> ingredients = [
    'Chicken',
    'Tomato',
    'Meat',
    'Cheese',
    'Garlic',
    'Onion',
    'Spices',
    'Fish',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recipe based on ingredients",
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/ingredient-search');
                  },
                  child: Text(
                    "Show more",
                    style: TextStyle(
                      fontSize: fontSizeSmall,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.87, crossAxisCount: 4),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = ingredients[index];
                  return GestureDetector(
                    onTap: () {
                      context.push('/ingredient-search/$ingredient');
                    },
                    child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 100,
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(largeRounded),
                              // border: Border.all(color: Colors.grey),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/ingredients/${++index}.png"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            ingredient,
                            style: TextStyle(
                              fontSize: fontSizeSmall,
                            ),
                          )
                        ])),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
