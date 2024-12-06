// ignore_for_file: file_names
import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';



class RecipesSection extends StatelessWidget {
  const RecipesSection({super.key, required this.title, required this.recipeData});

  final String title;
  final Future recipeData;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style:
                TextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.only(bottom: 12),
          child: FutureBuilder(
            future: recipeData,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 12),
                    child: RecipeCard(id: snapshot.data[index]["id"], title: snapshot.data[index]["title"], imageUrl: snapshot.data[index]["image"],),
                  );
                });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ),
      ],
    );
  }
}

