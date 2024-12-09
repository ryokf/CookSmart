import 'dart:convert';

import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Config/api.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, required this.query, this.diet});
  final String query;
  final String? diet;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> diets = [
      'Gluten Free',
      'Ketogenic',
      'Vegetarian',
      'Lacto-Vegetarian',
      'Ovo-Vegetarian',
      'Vegan',
      'Pescetarian',
      'Paleo',
      'Primal',
      'Whole30',
    ];

    Future recipeData() async {
      var getData = Uri.https(api_url, "/recipes/complexSearch",
          {"query": widget.query, "diet": widget.diet});
      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data["results"];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Hasil Pencarian "${widget.query}"',
          style: TextStyle(color: Colors.black, fontSize: fontSizeLarge),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: FutureBuilder(
          future: recipeData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SearchInput(
                      helperText: "",
                      onSubmitted: (value) {
                        context.push('/search/$value/Preferensi diet');
                      },
                    ),
                    Container(
                      height: 35,
                      width: 160,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        hint: Text(
                          widget.diet!,
                          style: TextStyle(
                              fontSize: fontSizeBase, color: Colors.black54),
                        ),
                        items: diets
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {
                          context.push('/search/${widget.query}/$value');
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      height: 200.0 * snapshot.data!.length.toDouble() / 2,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: ScrollController(
                          keepScrollOffset: false,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(
                            id: snapshot.data![index]["id"],
                            imageUrl: snapshot.data![index]["image"],
                            title: snapshot.data![index]["title"],
                            onTap: () {
                              context.push('/recipe/${snapshot.data[index]["id"]}');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
