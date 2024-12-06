// ignore_for_file: file_names

import 'dart:convert';

import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Config/api.dart';
import 'package:cook_smart/Pages/HomePage/Header.dart';
import 'package:cook_smart/Pages/HomePage/IngredientsSection.dart';
import 'package:cook_smart/Pages/HomePage/RecipesSection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future popularRecipe() async {
      var getData = Uri.https(api_url, "/recipes/complexSearch",
          {"sort": "popularity", "number": "5"});
      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data["results"];
    }

    Future recomendedRecipe() async {
      var getData = Uri.https(api_url, "/recipes/complexSearch",
          {"sort": "random", "number": "5"});

      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data["results"];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: SearchInput(
                onSubmitted: (value) {
                  context.push('/search/$value/Preferensi Diet');
                },
              ),
            ),
            IngredientSection(),
            RecipesSection(
              recipeData: popularRecipe(),
              title: "Popular Recipes",
            ),
            RecipesSection(
              recipeData: recomendedRecipe(),
              title: "Latest Recipes",
            ),
          ],
        ),
      ),
    );
  }
}
