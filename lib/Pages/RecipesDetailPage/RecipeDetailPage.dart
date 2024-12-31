import 'dart:convert';

import 'package:cook_smart/Config/api.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Header.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Info.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/InfoSection.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Ingredients.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Instructions.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Nutritions.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:cook_smart/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key, required this.recipeId});
  final String recipeId;

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    Future detailRecipe() async {
      var getData = Uri.https(
          api_url,
          "/recipes/${widget.recipeId}/information",
          {"includeNutrition": "true"});
      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data;
    }

    Future recipeInstructions() async {
      var getData = Uri.https(
          api_url,
          "/recipes/${widget.recipeId}/analyzedInstructions",
          {"stepBreakdown": "true"});
      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data[0]["steps"];
    }

    return Scaffold(
      body: FutureBuilder(
        future: detailRecipe(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data['id']);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Header(
                      title: snapshot.data["title"]!,
                      imageUrl: snapshot.data["image"],
                      description: snapshot.data["summary"].split(".")[0],
                      onPress: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('sedang menyimpan...')),
                          );
                          final recipeData = {
                            'id': snapshot.data['id'].toString(),
                            'title': snapshot.data['title'],
                            'imageUrl': snapshot.data['image'],
                            'summary': snapshot.data['summary'],
                            'timeCooking': snapshot.data['readyInMinutes'],
                            'calories': snapshot.data['nutrition']['nutrients']
                                [0]['amount'],
                            'healthScore': snapshot.data['healthScore'],
                            'ingredients': jsonEncode(snapshot
                                .data['extendedIngredients']
                                .map((ingredient) => ingredient['original'])
                                .toList()),
                            'steps': jsonEncode((await recipeInstructions())
                                .map((step) => step['step'])
                                .toList()),
                          };
                          await DatabaseHelper.instance.insertRecipe(recipeData);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Resep berhasil disimpan!')),
                          );
                        },
                    ),
                    InfoSection(
                      timeCooking: snapshot.data["readyInMinutes"],
                      calories: snapshot.data["nutrition"]["nutrients"][0]
                          ["amount"],
                      healthScore: snapshot.data["healthScore"],
                    ),
                    TabBar(
                      // indicatorPadding: EdgeInsets.only(top: 100),
                      controller: _tabController,
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                        Tab(
                          text: "Ingredients",
                        ),
                        Tab(
                          text: "Steps",
                        ),
                        Tab(
                          text: "Nutrition",
                        ),
                        Tab(
                          text: "Info",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 750,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Center(
                              child: Ingridients(
                                  ingredientsData:
                                      snapshot.data["extendedIngredients"])),
                          Instructions(
                            instructionData: recipeInstructions(),
                          ),
                          Nutrition(
                            nutritionData:
                                snapshot.data["nutrition"]!["nutrients"],
                          ),
                          Info(
                            additionalInfo: snapshot.data["nutrition"]
                                ["properties"],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
