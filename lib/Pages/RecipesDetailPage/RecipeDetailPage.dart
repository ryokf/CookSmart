import 'package:cook_smart/Pages/RecipesDetailPage/Header.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Info.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/InfoSection.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Ingredients.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Instructions.dart';
import 'package:cook_smart/Pages/RecipesDetailPage/Nutritions.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> with TickerProviderStateMixin {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Header(),
              const InfoSection(),
              TabBar(
                controller: _tabController,
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    text: "Bahan",
                  ),
                  Tab(
                    text: "Langkah",
                  ),
                  Tab(
                    text: "Nutrisi",
                  ),
                  Tab(
                    text: "Info",
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(child: Ingridients()),
                    Center(child: Instructions()),
                    Center(child: Nutrition()),
                    Center(child: Info()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}