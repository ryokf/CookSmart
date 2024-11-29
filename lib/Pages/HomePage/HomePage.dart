import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Pages/HomePage/Header.dart';
import 'package:cook_smart/Pages/HomePage/IngredientsSection.dart';
import 'package:cook_smart/Pages/HomePage/RecipesSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SearchInput(),
            ),
            IngredientSection(),
            RecipesSection(),
            RecipesSection(),
          ],
        ),
      ),
    );
  }
}
