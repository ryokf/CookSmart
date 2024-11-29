// ignore_for_file: file_names

import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class RecipesSection extends StatelessWidget {
  const RecipesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Resep terbaru",
            style:
                TextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.only(bottom: 12),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: RecipeCard(),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
