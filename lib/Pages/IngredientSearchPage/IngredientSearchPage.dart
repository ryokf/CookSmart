import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Components/TitleBar.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IngredientSearchPage extends StatelessWidget {
  const IngredientSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
    'Chicken',
    'Tomato',
    'Meat',
    'Cheese',
    'Garlic',
    'Onion',
    'Spices',
    'Fish',
    'Noodle',
    'Banana',
    'Chocolate',
    'Egg',
  ];

    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          TitleBar(
            size: size,
            innerBoxIsScrolled: innerBoxIsScrolled,
            title: innerBoxIsScrolled
                ? "Search Based on Ingredients"
                : "Search Based on \n Ingredients",
          )
        ];
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchInput(
                helperText: "pisahkan setiap bahan dengan koma",
                onSubmitted: (value){
                  context.push('/ingredient-search/$value');
                }, 
              ),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = ingredients[index];
                    return GestureDetector(
                      onTap: () {
                        context.push('/ingredient-search/$ingredient');
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          height: 100,
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(largeRounded),
                                border: Border.all(color: Colors.grey),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
