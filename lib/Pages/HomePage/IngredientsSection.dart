// ignore_for_file: file_names

import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class IngredientSection extends StatelessWidget {
  IngredientSection({super.key});

  final List<String> ingredients = [
    'Pasta',
    'Tomato',
    'Onion',
    'Garlic',
    'Spices',
    'Cheese',
    'Meat',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: backgroundColor, // Background warna krem
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
            decoration:  BoxDecoration(
              color: Colors.grey[200], // Warna header lebih gelap
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Resep berdasarkan bahan",
                  
                ),
                Text(
                  "Show more",
                  style: TextStyle(
                    fontSize: fontSizeSmall,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemCount: ingredients.length, itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(largeRounded),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(child: Text(ingredient)),
              );
            }),
          ), // Area kosong untuk konten
        ],
      ),
    );
  }
}
