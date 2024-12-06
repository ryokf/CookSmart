import 'dart:convert';

import 'package:cook_smart/Components/RecipeCard.dart';
import 'package:cook_smart/Components/SearchInput.dart';
import 'package:cook_smart/Config/api.dart';
import 'package:cook_smart/Themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class SearchIngredientsResultPage extends StatefulWidget {
  const SearchIngredientsResultPage({super.key, required this.query});
  final String query;

  @override
  State<SearchIngredientsResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchIngredientsResultPage> {
  @override
  Widget build(BuildContext context) {

    String ingredients = widget.query;

    Future recipeData() async {
      var getData = Uri.https(api_url, "/recipes/findByIngredients",
          {"ingredients": ingredients});
      var response = await http.get(getData, headers: {"x-api-key": api_key});
      var data = jsonDecode(response.body);
      return data;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Ingredient Based Search Result',
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
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchInput(
                helperText: "pisahkan setiap bahan dengan koma",
                onSubmitted: (value){
                  context.push('/ingredient-search/$value');
                }, 
              ),
            const SizedBox(
              height: 12,
            ),
            // Container(
            //   height: 35,
            //     padding: const EdgeInsets.symmetric(horizontal: 12),
            //     decoration: BoxDecoration(
            //       color: Colors.orange.shade50,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: DropdownButton(
            //       underline: Container(),
            //       hint: Text(
            //         'Pilih Bahan',
            //         style: TextStyle(fontSize: fontSizeBase),
            //       ),
            //       items: [
            //         DropdownMenuItem(
            //           value: 'Pasta',
            //           child: Text(
            //             'Pasta',
            //             style: TextStyle(fontSize: fontSizeBase),
            //           ),
            //         ),
            //         DropdownMenuItem(
            //           value: 'Tomato',
            //           child: Text(
            //             'Tomato',
            //             style: TextStyle(fontSize: fontSizeBase),
            //           ),
            //         ),
            //         DropdownMenuItem(
            //           value: 'Onion',
            //           child: Text(
            //             'Onion',
            //             style: TextStyle(fontSize: fontSizeBase),
            //           ),
            //         ),
            //         DropdownMenuItem(
            //           value: 'Garlic',
            //           child: Text(
            //             'Garlic',
            //             style: TextStyle(fontSize: fontSizeBase),
            //           ),
            //         ),
            //       ],
            //       onChanged: (value) {},
            //     )),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 700,
              child: FutureBuilder(
                future: recipeData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        controller: ScrollController(
                          keepScrollOffset: true,
                        ),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(id: snapshot.data![index]["id"], imageUrl: snapshot.data![index]["image"], title: snapshot.data![index]["title"],);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
