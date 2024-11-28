import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Pages/HomePage/Header.dart';
import 'package:cook_smart/Pages/HomePage/IngredientsSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Header(),
          SearchInput(),
          IngredientSection(),
        ],
      ),
    );
  }
}
